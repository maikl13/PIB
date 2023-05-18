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
import '../../../../core/widgets/confirmation_dialog.dart';
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

    return  SingleChildScrollView(


      child: Container(

        margin: EdgeInsets.only(right: 20.w, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainAuthHeadline(),
            SizedBox(height: 30.h),
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
      ),
    );
  }

  _buildBloc() {
    return BlocConsumer<AuthCubit, AuthResultState>(
      listener: (context, state) {
        state.whenOrNull(
          firebaseAnonymousLoginError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
          firebaseAnonymousLoginLoading: () {
            Commons.showLoadingDialog(context ,  text:  "جار إعداد حسابك");
          },
          firebaseAnonymousLoginSuccess: (data) {

            BlocProvider.of<AuthCubit>(context).register(
                uid: data,
                name: 'مجهول',
                email: '',
                phone: '000000000',
                imageUrl:
                'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/no-profile-picture-icon.png');
          },
          phoneAuthLoading: () {
            Commons.showLoadingDialog(context ,text:  "جار إعداد حسابك");
          },
          phoneNumberSubmited: () {
            // ignore: avoid_print
            // print(uid);
            Navigator.pop(context);
            Navigator.of(context).pushNamed(Routes.confirmOtbViewRoute);
          },
          phoneAuthErrorOccurred: (errorMsg) {
            Navigator.pop(context);
            Commons.showToast(message: errorMsg);
          },
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
           // todo Commons.showLoadingDialog(context ,text:  "جار إعداد حسابك");
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
                name: userName ?? '',
                imageUrl: userImage ?? '',
                email: userEmail ?? '',
                phone: userPhone ?? '',
              );
            } else {
              Commons.showToast(
                color: ColorManager.error,
                message: NetworkExceptions.getErrorMessage(networkExceptions),
              );
            }
          },
          registerLoading: () {
            // todo Commons.showLoadingDialog(context ,text:  "جار إعداد حسابك");
          },
          registerSuccess: (user) {
            Navigator.pop(context);
            user.user!.name == 'مجهول'
                ? Navigator.pushNamedAndRemoveUntil(
                context, Routes.mainHomeViewRoute, (route) => false)
                : showSuccessDialog(context);
          },
          registerError: (networkExceptions) {
            Navigator.pop(context);
            if(NetworkExceptions.getErrorMessage(networkExceptions) == "المستخدم موجود سابقا"){


              showDialog(
                  context: context,
                  builder: (BuildContext dialog) =>
                      ConfirmationDialog(alertMsg: 'هذا المستخدم موجود مسبقا ، يمكنك الانتقال لصفحة تسجيل الدخول او محاولة استخدام رقم اخر',cancel:   "ادخل الرقم مجددا"  , ok: "صفحة الدخول", onTapConfirm: () {


                      //  Navigator.pop(dialog);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }));
            }else{
              Commons.showToast(
                color: ColorManager.error,
                message: NetworkExceptions.getErrorMessage(networkExceptions),
              );
            }



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
        actions:  [
          Container(
            padding: EdgeInsets.only(top: 23),
            child:  SkipText(),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }
}
