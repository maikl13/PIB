import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/default_button.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/default_textfield.dart';

class EditPasswordView extends StatelessWidget {
  const EditPasswordView({super.key});

  _buildBody() {
    return ListView(
      padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildLogo(),
        SizedBox(height: 30.h),
        _buildOldPasswordTextField(),
        SizedBox(height: 20.h),
        _buildNewPasswordTextField(),
        SizedBox(height: 20.h),
        _buildConfirmPasswordTextField(),
        SizedBox(height: 292.h),
        _buildButton(),
      ],
    );
  }

  _buildLogo() {
    return Image.asset(
      ImageAssets.splashLogo,
      width: 88.w,
      height: 60.h,
    );
  }

  _buildOldPasswordTextField() {
    return DefaultTextField(
        prefix: Icon(
          Icons.lock,
          color: ColorManager.darkSeconadry,
          size: 20.sp,
        ),
        hint: 'كلمة المرور القديمة');
  }

  _buildNewPasswordTextField() {
    return DefaultTextField(
        prefix: Icon(
          Icons.lock,
          color: ColorManager.darkSeconadry,
          size: 20.sp,
        ),
        hint: 'كلمة المرور الجديدة');
  }

  _buildConfirmPasswordTextField() {
    return DefaultTextField(
        prefix: Icon(
          Icons.lock,
          color: ColorManager.darkSeconadry,
          size: 20.sp,
        ),
        hint: 'تاكيد كلمة المرور الجديدة');
  }

  _buildButton() {
    return DefaultButton(text: AppStrings.addOffer, onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.editPassword,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
