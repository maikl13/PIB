import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
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
  const GiveOfferView({super.key, required this.requestId});

  final String requestId;

  @override
  State<GiveOfferView> createState() => _GiveOfferViewState();
}

class _GiveOfferViewState extends State<GiveOfferView> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _timeToCompleteController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void refresh() {
    setState(() {});
  }

  _buildBody(BuildContext context) {
    return BlocListener<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          giveOfferSuccess: (data) {
            showSuccessOfferDialog(
              context,
              onOk: () {
                screenIndex = 2;
                Navigator.pushReplacementNamed(
                    context, Routes.mainHomeViewRoute);
              },
            );
          },
          giveOfferError: (error) {
            Commons.showToast(message: error.toString());
          },
        );
      },
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
    );
  }

  _buildPhotos() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {},
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
        BlocProvider.of<RequestsCubit>(context).giveOffer(
          price: _priceController.text,
          duration: _timeToCompleteController.text,
          description: _descriptionController.text,
          requestId: widget.requestId,
        );
      },
    );
  }

  _buildPriceTextField() {
    return RequestCustomTextField(
      controller: _priceController,
      hint: AppStrings.price,
      icon: FontAwesomeIcons.tags,
    );
  }

  _buildTimeToCompleteTextField() {
    return RequestCustomTextField(
      controller: _timeToCompleteController,
      suffix: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 10.h),
        child: Text(AppStrings.days,
            style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white)),
      ),
      hint: AppStrings.timeToComplete,
      icon: FontAwesomeIcons.solidClock,
    );
  }

  _buildDescriptionTextField() {
    return RequestCustomTextField(
      controller: _descriptionController,
      bottomPadding: 70,
      maxLines: 3,
      hint: AppStrings.description,
      icon: FontAwesomeIcons.alignLeft,
    );
  }

  _buildUploadPhotoTextField(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<RequestsCubit>(context).pickImage();
        // Navigator.pushNamed(context, Routes.searchMainViewRoute);
      },
      child: Container(
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
                      child: Icon(
                        Icons.upload,
                        color: ColorManager.white,
                        size: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                  Text(AppStrings.uploadPhotos,
                      style: getRegularStyle(
                          fontSize: 15.sp, color: ColorManager.grey5)),
                ],
              ),
              IconButton(
                  splashColor: ColorManager.transparent,
                  icon: Icon(
                    Icons.add,
                    color: ColorManager.darkSeconadry,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(Ro.search);
                  })
            ],
          ),
        ),
      ),
    );
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
