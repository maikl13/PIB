import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../../business_logic/cubit/auth_state.dart';
import '../widgets/pin_code_fields.dart';

class ConfirmPhoneView extends StatefulWidget {
  const ConfirmPhoneView({
    super.key,
  });

  @override
  State<ConfirmPhoneView> createState() => _ConfirmPhoneViewState();
}

class _ConfirmPhoneViewState extends State<ConfirmPhoneView> {
  String? enteredOtpCode;

  Widget _buildConfirmPhoneViewBody(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
      children: [
        _buildConfirmPhoneViewHeadline(context),
        SizedBox(height: 12.h),
        _buildConfirmPhoneViewSubTitle(context),
        SizedBox(height: 40.h),
        _buildOtpCodeTextField(),
        SizedBox(height: 82.h),
        // _buildRemainingTime(),
        SizedBox(height: 82.h),
        // const ResendCode(),
        SizedBox(height: 202.h),
        _buildConfirmButton(),
        _buildPhoneVerificationBloc(),
      ],
    );
  }

  _buildOtpCodeTextField() {
    return CustomPinCodeFields(
      onCompleted: (submitedCode) {
        enteredOtpCode = submitedCode;
      },
      onChanged: (p0) {},
    );
  }

  Widget _buildConfirmPhoneViewHeadline(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 95.w),
      child: Text(AppStrings.confirmPhoneNumber,
          style: getBoldStyle(fontSize: 18.sp, color: ColorManager.white)),
    );
  }

  Widget _buildConfirmPhoneViewSubTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 70.w, right: 70.w),
      child: Text(
          textAlign: TextAlign.center,
          AppStrings.confirmPhoneHint,
          style: getRegularStyle(fontSize: 14.sp, color: ColorManager.white)),
    );
  }

  Widget _buildConfirmButton() {
    return DefaultButton(
      text: AppStrings.confirm,
      onTap: () {
        // showProgressIndicator(context);
        BlocProvider.of<AuthCubit>(context).submitOTP(enteredOtpCode!);
      },
    );
  }

  Widget _buildPhoneVerificationBloc() {
    return BlocListener<AuthCubit, AuthResultState>(
      listener: (context, state) {
        state.whenOrNull(
          // phoneAuthLoading: () {
          //   showProgressIndicator(context);
          // },
          phoneOTPVerified: () {
            Navigator.pop(context);
            showSuccessDialog(
              context,
         
            );
          },
          phoneAuthErrorOccurred: (errorMsg) {
            Commons.showToast(message: errorMsg);
          },
        );
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.confirmPhoneNumber,
        actions: [],
      ),
      body: _buildConfirmPhoneViewBody(context),
    );
  }
}
