import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/custom_network_image.dart';
import 'package:pip/core/widgets/default_button.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/default_phone_textfield.dart';
import '../../../../core/widgets/default_textfield.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  _buildBody(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w, bottom: 20.h),
      shrinkWrap: true,
      children: [
        _buildProfileImage(),
        SizedBox(height: 49.h),
        _buildNameTextField(),
        SizedBox(height: 20.h),
        const DefaultPhoneTextField(),
        SizedBox(height: 20.h),
        _buildEmailTextField(),
        SizedBox(height: 192.h),
        const DefaultButton(text: AppStrings.editData)
      ],
    );
  }

  _buildProfileImage() {
    return SizedBox(
        width: 103.h,
        height: 103.h,
        child: Stack(
          // fit: StackFit.expand,
          children: [
            _buildImage(),
            _buildEditButton(),
          ],
        ));
  }

  _buildImage() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 103.h,
        height: 103.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorManager.darkSeconadry, width: 3.sp),
        ),
        child: CircleAvatar(
            backgroundColor: ColorManager.black,
            child: ClipOval(
              child: CustomNetworkCachedImage(
                url: userImage,
              ),
            )),
      ),
    );
  }

  _buildEditButton() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 25.w,
          height: 25.h,
          decoration: BoxDecoration(
            color: ColorManager.darkSeconadry,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 12.sp,
          ),
        ),
      ),
    );
  }

  _buildNameTextField() {
    return DefaultTextField(
      hint: AppStrings.name,
      prefix: Icon(
        Icons.person,
        color: ColorManager.darkSeconadry,
        size: 20.sp,
      ),
    );
  }

  _buildEmailTextField() {
    return DefaultTextField(
        prefix: Icon(
          Icons.mail,
          color: ColorManager.darkSeconadry,
          size: 20.sp,
        ),
        hint: 'email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.editProfile,
        actions: [],
      ),
      body: _buildBody(context),
    );
  }
}
