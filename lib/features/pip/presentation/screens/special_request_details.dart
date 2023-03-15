import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/resources/constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/default_button.dart';
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
  _buildBody() {
    return Padding(
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
            const UploadedPhotos(),
            SizedBox(height: 100.h),
            const DefaultButton(text: AppStrings.puplish),
          ],
        ),
      ),
    );
  }

  _buildAvaialbleTypesOfJobs() {
    return GridView.builder(
      itemCount: 6,
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
          title: typesTitles[index],
          image: typeIcons[index],
          onTap: () {
            setState(() {
              isSelected = index;
            });
          },
        );
      },
    );
  }

  _buildPriceTextField() {
    return RequestCustomTextField(
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
    return const RequestCustomTextField(
      hint: AppStrings.location,
      // ignore: deprecated_member_use
      icon: FontAwesomeIcons.mapMarkerAlt,
    );
  }

  _buildDescriptionTextField() {
    // ignore: prefer_const_constructors
    return RequestCustomTextField(
      bottomPadding: 70,
      // suffix: Container(),

      // contentPadding: EdgeInsets.only(bottom: 72.h),
      maxLines: 3,
      hint: AppStrings.description,
      icon: FontAwesomeIcons.alignLeft,
    );
  }

  _buildUploadPhotoTextField() {
    return InkWell(
      onTap: () {
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
        title: AppStrings.specialRequest,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
