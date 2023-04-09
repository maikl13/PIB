import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../business_logic/cubit/requests_state.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../pip/presentation/widgets/request_custom_tetfield.dart';

import '../../../pip/presentation/widgets/upload_photos.dart';

class GiveOfferView extends StatefulWidget {
  const GiveOfferView({super.key, required this.requestId , required this.jobName});

  final String requestId , jobName;

  @override
  State<GiveOfferView> createState() => _GiveOfferViewState();
}

class _GiveOfferViewState extends State<GiveOfferView> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _timeToCompleteController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void refresh() {
    setState(() {});
  }

  _buildBody(BuildContext context) {
    return BlocListener<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          giveOfferLoading: () {
            Commons.showLoadingDialog(context);
          },
          giveOfferSuccess: (data) {
            // BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();

            Navigator.pop(context);

            showSuccessOfferDialog(
              context,
              title:widget.jobName,
              onOk: () {
                setState(() {
                  screenIndex = 2;
                  // selectedTab = 2;
                });
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.mainHomeViewRoute, (route) => false);
              },
            );
          },
          giveOfferError: (error) {
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(error),
            );
          },
        );
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h, bottom: 35.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const CustomTitle(title: AppStrings.chooseType),
                // SizedBox(height: 20.h),
                // _buildAvaialbleTypesOfJobs(),
                SizedBox(height: 20.h),
                _buildPriceTextField(),
                SizedBox(height: 20.h),
                _buildTimeToCompleteTextField(),
                SizedBox(height: 20.h),
                _buildDescriptionTextField(),
                SizedBox(height: 20.h),
                _buildUploadPhotoTextField(context),
                SizedBox(height: 20.h),
                _buildPhotos(),
                SizedBox(height: 100.h),
                _buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildPhotos() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          imageSelectedLoading: () {
            Commons.showLoadingDialog(context);
          },
          imageSelectedSuccess: (data) {
            Navigator.pop(context);
          },
          imageSelectedError: () {
            Navigator.pop(context);
          },
        );
      },
      buildWhen: (previous, next) =>
          next is ImageSelectedSuccess || next is ImageSelectedDeleted,
      builder: (context, state) {
        return state.maybeWhen(
          imageSelectedSuccess: (images) {
            return _buildListPhotos(images);
          },
          imageSelectedDeleted: (images) {
            return _buildListPhotos(images);
          },
          orElse: () => Container(),
        );
      },
    );
  }

  _buildListPhotos(List<File> images) {
    return BlocListener<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          imageSelectedDeleted: (images) {
            Commons.showToast(message: "Image Deleted Successfully");
            // print(images.length);
          },
        );
      },
      child: SizedBox(
        height: 130.h,
        child: ReorderableListView.builder(
            onReorder: BlocProvider.of<RequestsCubit>(context).onReorder,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return UploadedPhotos(
                key: Key('$index'),
                imageFile: images[index],
                onTap: () {
                  BlocProvider.of<RequestsCubit>(context).deleteImage(index);
                  setState(() {});
                },
              );
            },
            itemCount: images.length),
      ),

      // itemCount: images.length),
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.send,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          BlocProvider.of<RequestsCubit>(context).giveOffer(
            price: _priceController.text,
            duration: _timeToCompleteController.text,
            description: _descriptionController.text,
            requestId: widget.requestId,
          );
        } else {
          return Commons.showToast(message: 'من فضلك ادخل البيانات بشكل صحيح');
        }
      },
    );
  }

  _buildPriceTextField() {
    return RequestCustomTextField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp("[0-9]"),
        ),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      controller: _priceController,
      hint: AppStrings.price,
      icon: ImageAssets.tags,
    );
  }

  _buildTimeToCompleteTextField() {
    return RequestCustomTextField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp("[0-9]"),
        ),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      controller: _timeToCompleteController,
      suffix: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 10.h),
        child: Text(AppStrings.days,
            style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white)),
      ),
      hint: AppStrings.timeToComplete,
      icon: ImageAssets.clock,
    );
  }

  _buildDescriptionTextField() {
    return RequestCustomTextField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      // contentPadding: EdgeInsets.only(top: 15.h, bottom: 60.h),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      controller: _descriptionController,
      bottomPadding: 40.h,
      hint: AppStrings.description,

      topPadding: 0.h,
      maxLines: 3,
      label: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppStrings.description,
                style:
                    getBoldStyle(fontSize: 15.sp, color: ColorManager.grey5)),
          ],
        ),
      ),
      // hint: AppStrings.description,
      icon: ImageAssets.title,
    );
  }

  _buildUploadPhotoTextField(BuildContext context) {
    return  InkWell(
        onTap: () {
      BlocProvider.of<RequestsCubit>(context).pickImage();
    },
    child:Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: ColorManager.lightBlack,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 35.w,
                  height: 35.h,
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: ColorManager.darkSeconadry,
                    child: Image.asset(
                      ImageAssets.upload,
                      width: 18.w,
                      height: 18.h,
                      color: ColorManager.white,
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Text(AppStrings.uploadPhotos,
                    style: getBoldStyle(
                        fontSize: 15.sp, color: ColorManager.grey5)),
              ],
            ),
            Image.asset(
              ImageAssets.add,
              width: 20.w,
              height: 20.h,
              color: ColorManager.darkSeconadry,
            )

          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.giveOffer,
        actions: const [],
      ),
      body: _buildBody(context),
    );
  }
}
