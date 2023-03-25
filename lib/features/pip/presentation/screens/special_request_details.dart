import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/widgets/loading_indicator.dart';
import '../../../../core/resources/constants.dart';
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
            Navigator.pop(context);
            Commons.showToast(
                message: 'offer created', color: ColorManager.green);
            _clear();
            Navigator.pop(context);
          },
          createSpecialRequestError: (error) {
            Navigator.pop(context);
            Commons.showToast(message: error.toString());
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
      listener: (context, state) {},
      buildWhen: (previous, next) =>
          next is ImageSelectedSuccess || next is ImageSelectedDeleted,
      builder: (context, state) {
        return state.maybeWhen(
          imageSelectedLoading: () {
            return const LoadingIndicator();
          },
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
              ? Commons.showToast(message: "choose category")
              : BlocProvider.of<PipCubit>(context).createSpecialRequest(
                  categoryId: selectedId.toString(),
                  price: _priceController.text,
                  location: _locationController.text,
                  description: _descriptionController.text,
                );
        } else {
          return Commons.showToast(message: 'enter value please');
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
          return 'enter value';
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
      icon: FontAwesomeIcons.tags,
    );
  }

  _buildLocationTextField() {
    return RequestCustomTextField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'enter value';
        }
        return null;
      },
      controller: _locationController,
      hint: AppStrings.location,
      // ignore: deprecated_member_use
      icon: FontAwesomeIcons.mapMarkerAlt,
    );
  }

  _buildDescriptionTextField() {
    return RequestCustomTextField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'enter value';
        }
        return null;
      },
      controller: _descriptionController,
      bottomPadding: 70,
      maxLines: 3,
      hint: AppStrings.description,
      icon: FontAwesomeIcons.alignLeft,
    );
  }

  _buildUploadPhotoTextField() {
    return InkWell(
      onTap: () {
        BlocProvider.of<PipCubit>(context).pickImage();
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
