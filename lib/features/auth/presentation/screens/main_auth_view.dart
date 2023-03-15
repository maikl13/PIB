import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/skip_text.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../../business_logic/cubit/auth_state.dart';
import '../widgets/main_auth_headline.dart';
import '../widgets/social_button.dart';

import '../../../../core/resources/style_manager.dart';

class MainAuthView extends StatelessWidget {
  const MainAuthView({super.key});

  _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20, bottom: 30.h),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainAuthHeadline(),
          _buildLogo(),
          SizedBox(height: 50.h),
          DefaultButton(
            text: AppStrings.registerNewAcc,
            onTap: () {
              Navigator.pushNamed(context, Routes.registerViewRoute);
            },
          ),
          SizedBox(height: 25.h),
          DarkDefaultButton(
            text: AppStrings.login,
            onTap: () {
              Navigator.pushNamed(context, Routes.loginViewRoute);
            },
          ),
          SizedBox(height: 76.h),
          _buildOrLoginWith(),
          SizedBox(height: 29.h),
          _buildSocialButtons(context),
          _buildBloc(),
        ],
      ),
    );
  }

  _buildBloc() {
    return BlocConsumer<AuthCubit, AuthResultState>(
      listener: (context, state) {
        state.whenOrNull(
          firebaseFacebookLoginSuccess: (uid) {
            BlocProvider.of<AuthCubit>(context).login(uid: uid);
          },
          firebaseFacebookLoginError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
          firebaseGoogleLoginSuccess: (uid) {
            BlocProvider.of<AuthCubit>(context).login(uid: uid);
          },
          firebaseGoogleLoginError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
          loginLoading: () {
            Commons.showLoadingDialog(context);
          },
          loginSuccess: (uid) {
            Navigator.pop(context);
            showSuccessDialog(context);

            // _goToHomeSuccessfully(context);
          },
          loginError: (networkExceptions) {
            Navigator.pop(context);
            if (NetworkExceptions.getErrorMessage(networkExceptions) ==
                "not_found") {
              BlocProvider.of<AuthCubit>(context).register(
                uid: token!,
                name: userName!,
              );
            } else {
              Commons.showToast(
                color: ColorManager.error,
                message: NetworkExceptions.getErrorMessage(networkExceptions),
              );
            }
          },
          registerLoading: () {
            Commons.showLoadingDialog(context);
          },
          registerSuccess: (uid) {
            showSuccessDialog(context);
          },
          registerError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
        );
      },
      builder: (context, state) {
        return Container();
      },
    );
  }

  _buildLogo() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Image.asset(
        ImageAssets.authLogo,
        width: 294.66.w,
        height: 273.66.h,
        fit: BoxFit.contain,
      ),
    );
  }

  _buildOrLoginWith() {
    return Center(
      child: Text(AppStrings.orLoginWith,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: 14.sp,
          )),
    );
  }

  _buildSocialButtons(BuildContext context) {
    return Row(
      children: [
        SocialButton(
          icon: ImageAssets.facebook,
          title: AppStrings.facebook,
          onTap: () {
            BlocProvider.of<AuthCubit>(context).signInWithFacebook(context);
          },
        ),
        SizedBox(width: 8.w),
        SocialButton(
          icon: ImageAssets.google,
          title: AppStrings.login,
          onTap: () {
            BlocProvider.of<AuthCubit>(context).signInWithGoogle(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.transparent,
        actions: const [
          SkipText(),
        ],
      ),
      body: _buildBody(context),
    );
  }
}
