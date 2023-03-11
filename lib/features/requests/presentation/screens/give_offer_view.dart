import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../pip/presentation/widgets/request_custom_tetfield.dart';

import '../../../pip/presentation/widgets/upload_photos.dart';

class GiveOfferView extends StatelessWidget {
  const GiveOfferView({super.key});

  _buildBody(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h, bottom: 35.h),
      shrinkWrap: true,
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
        _buildUploadPhotoTextField(),
        SizedBox(height: 20.h),
        const UploadedPhotos(),
        SizedBox(height: 100.h),
        _buildButton(context),
      ],
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.send,
      onTap: () {
        showSuccessDialog(context);
      },
    );
  }

  _buildPriceTextField() {
    return const RequestCustomTextField(
      hint: AppStrings.price,
      icon: FontAwesomeIcons.tags,
    );
  }

  _buildTimeToCompleteTextField() {
    return RequestCustomTextField(
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
    return const RequestCustomTextField(
      bottomPadding: 70,
      maxLines: 3,
      hint: AppStrings.description,
      icon: FontAwesomeIcons.alignLeft,
    );
  }

  _buildUploadPhotoTextField() {
    return RequestCustomTextField(
      suffix: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 10.h),
        child: Icon(
          Icons.add,
          color: ColorManager.darkSeconadry,
          size: 20.sp,
        ),
      ),
      hint: AppStrings.uploadPhotos,
      icon: Icons.upload,
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
