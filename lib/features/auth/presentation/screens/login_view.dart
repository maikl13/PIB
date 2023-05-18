import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/resources/utils.dart';

import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/headline.dart';
import '../../../../core/widgets/sub_headline.dart';

import '../../../../core/resources/route_manager.dart';
import '../../../../core/widgets/default_phone_textfield.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../widgets/custom_bottom_phrase.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  late String phoneNumber;
  _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding:
          EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w, bottom: 20.h),
      children: [
        const CustomHeadline(title: AppStrings.login),
        SizedBox(height: 15.h),
        const CustomSubHeadLine(title: AppStrings.loginDescription),
        SizedBox(height: 40.h),
        // _buildNameTextField(),
        // SizedBox(height: 20.h),
        _buildPhoneTextField(),
        SizedBox(height: 150.h),
        _buildButton(context),

        SizedBox(height: 127.h),

        _buildBottomLoginHint(context),
        // _buildPhoneNumberSubmitedBloc()
      ],
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.login,
      onTap: () {
        // showProgressIndicator(context);
       setState(() {
          isLogin = true;
       });
        _login(context);
      },
    );
  }

  Future<void> _login(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Commons.showToast(message: 'الرجاء ادخال رقم الهاتف بشكل صحيح');
      // Navigator.pop(context);
    } else {
      _phoneFormKey.currentState!.save();
      BlocProvider.of<AuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }

  // _buildForgotPassword(BuildContext context) {
  _buildPhoneTextField() {
    return Form(
      key: _phoneFormKey,
      child: DefaultPhoneTextField(
        controller: _phoneController,
        onSaved: (value) {
          phoneNumber = value!.trim();
          userPhone = value;
        },
        validator: (value) {
          return validateMobile(value!);
          // hint: AppStrings.zeros,}
        },
      ),
    );
  }

  // _buildNameTextField() {
  // _buildNameTextField() {
  //   return DefaultTextField(
  //       controller: _nameController,
  //       onSaved: (value) {
  //         userName = value!;
  //       },
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return 'enter your name';
  //         }
  //         return null;
  //       },
  //       prefix: Icon(
  //         Icons.person,
  //         color: ColorManager.lightSeconadary,
  //         size: 20.sp,
  //       ),
  //       hint: AppStrings.name);
  // }

  _buildBottomLoginHint(BuildContext context) {
    return CustomBottomPhrase(
      text1: AppStrings.dontHaveAccount,
      text2: AppStrings.registerNewAcc,
      onPressed: () {
        Navigator.pushNamed(context, Routes.registerViewRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _buildBody(context),
    );
  }
}
