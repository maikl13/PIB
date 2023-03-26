import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/widgets/loading_indicator.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../business_logic/cubit/pip_cubit.dart';
import '../../business_logic/cubit/pip_state.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/default_button.dart';
import '../../data/models/skills_model.dart';
import '../widgets/job_type_item.dart';
import '../widgets/request_custom_tetfield.dart';

import '../widgets/upload_photos.dart';

class SpecialRequestDetailsView extends StatefulWidget {
  const SpecialRequestDetailsView({super.key});

  @override
  State<SpecialRequestDetailsView> createState() =>
      _SpecialRequestDetailsViewState();
}

class _SpecialRequestDetailsViewState extends State<SpecialRequestDetailsView> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? selectedId;
  _clear() {
    _priceController.clear();
    _locationController.clear();
    _descriptionController.clear();
    BlocProvider.of<PipCubit>(context).imagesFile.clear();
  }

  _buildBody() {
    return BlocListener<PipCubit, PipState>(
      listener: (context, state) {
        state.whenOrNull(
          createSpecialRequestLoading: () {
            Commons.showLoadingDialog(context);
          },
          createSpecialRequestSuccess: (data) {
            BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();

            Navigator.pop(context);
            Commons.showToast(
                message: 'تم انشاء الطلب بنجاح', color: ColorManager.green);
            _clear();
            Navigator.pop(context);
          },
          createSpecialRequestError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
        );
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(right: 20.w, left: 20.w, top: 35.h, bottom: 35.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitle(title: AppStrings.chooseType),
                SizedBox(height: 20.h),
                _buildAvaialbleTypesOfJobs(),
                SizedBox(height: 20.h),
                _buildPriceTextField(),
                SizedBox(height: 20.h),
                _buildLocationTextField(),
                SizedBox(height: 20.h),
                _buildDescriptionTextField(),
                SizedBox(height: 20.h),
                _buildUploadPhotoTextField(),
                SizedBox(height: 20.h),
                _buildPhotos(),
                SizedBox(height: 100.h),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildPhotos() {
    return BlocConsumer<PipCubit, PipState>(
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
    return SizedBox(
      height: 130.h,
      child: ReorderableListView.builder(
          onReorder: BlocProvider.of<PipCubit>(context).onReorder,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return UploadedPhotos(
              key: Key('$index'),
              imageFile: images[index],
              onTap: () {
                BlocProvider.of<PipCubit>(context).deleteImage(index);
                setState(() {});
              },
            );
          },
          itemCount: images.length),
    );
  }

  _buildButton() {
    return DefaultButton(
      text: AppStrings.puplish,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          selectedId == null
              ? Commons.showToast(message: "اختر نوع الطلب")
              : BlocProvider.of<PipCubit>(context).createSpecialRequest(
                  categoryId: selectedId.toString(),
                  price: _priceController.text,
                  location: _locationController.text,
                  description: _descriptionController.text,
                );
        } else {
          return Commons.showToast(message: 'من فضلك ادخل البيانات بشكل صحيح');
        }
      },
    );
  }

  _buildAvaialbleTypesOfJobs() {
    return BlocConsumer<PipCubit, PipState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is SkillsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          skillsLoading: () {
            return const LoadingIndicator();
          },
          skillssuccess: (skills) {
            return _buildSkills(skills);
          },
          orElse: () => Container(),
        );
      },
    );
  }

  _buildSkills(List<SkillModel> skills) {
    return GridView.builder(
      itemCount: skills.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return JobTypeItem(
          index: index,
          title: skills[index].name!,
          image: skills[index].imageUrl!,
          onTap: () {
            setState(() {
              isSelected = index;
            });
            index == isSelected
                ? selectedId = skills[index].id
                : selectedId = null;
          },
        );
      },
    );
  }

  _buildPriceTextField() {
    return RequestCustomTextField(
      controller: _priceController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        if (int.parse(value) < 50) {
          return 'السعر يجب ان يكون اكبر من 50';
        }

        return null;
      },
      suffix: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 10.h),
        child: Text(
          AppStrings.startWithPrice,
          style:
              getBoldStyle(fontSize: 15.sp, color: ColorManager.darkSeconadry),
        ),
      ),
      hint: AppStrings.price,
      icon: ImageAssets.priceTag,
    );
  }

  _buildLocationTextField() {
    return RequestCustomTextField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      controller: _locationController,
      hint: AppStrings.location,
      // ignore: deprecated_member_use
      icon: ImageAssets.pin1,
    );
  }

  _buildDescriptionTextField() {
    return RequestCustomTextField(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      // contentPadding: EdgeInsets.only(top: 15.h, bottom: 60.h),
      // floatingLabelBehavior: FloatingLabelBehavior.never,
      controller: _descriptionController,
      bottomPadding: 40.h,
      topPadding: 0.h,
      maxLines: 3,
      hint: AppStrings.description,
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

  _buildUploadPhotoTextField() {
    return Container(
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
                      )),
                ),
                SizedBox(width: 30.w),
                Text(AppStrings.uploadPhotos,
                    style: getRegularStyle(
                        fontSize: 15.sp, color: ColorManager.grey5)),
              ],
            ),

            // splashColor: ColorManager.transparent,
            InkWell(
              onTap: () {
                BlocProvider.of<PipCubit>(context).pickImage();
              },
              child: Image.asset(
                ImageAssets.add,
                width: 20.w,
                height: 20.h,
                color: ColorManager.darkSeconadry,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<PipCubit>(context).getAllSkills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.specialRequest,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }

  @override
  void didChangeDependencies() {
    BlocProvider.of<PipCubit>(context).imagesFile = [];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    isSelected = -1;
    super.dispose();
  }
}
