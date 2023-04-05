import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/constants.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/default_textfield.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../../business_logic/cubit/auth_state.dart';
import '../widgets/custom_bottom_phrase.dart';
import '../widgets/custom_hint_text.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_phone_textfield.dart';
import '../../../../core/widgets/headline.dart';
import '../../../../core/widgets/sub_headline.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // String phoneNumber = '';
  Widget _buildBody(BuildContext context) {
    return Form(
      key: _phoneFormKey,
      child: ListView(
        shrinkWrap: true,
        padding:
            EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w, bottom: 20.h),
        children: [
          const CustomHeadline(title: AppStrings.registerNewAcc),
          SizedBox(height: 15.h),
          const CustomSubHeadLine(title: AppStrings.registerDescription),
          SizedBox(height: 40.h),
          _buildNameTextField(),
          SizedBox(height: 20.h),
          DefaultPhoneTextField(
            onSaved: (value) {
              userPhone = value!;
            },
            controller: _phoneController,
          ),
          SizedBox(height: 60.h),
          // _buildPasswordTextField(),
          SizedBox(height: 100.h),
          _buildButton(context),
          SizedBox(height: 22.h),
          Center(
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, Routes.termsAndConditionViewRoute);
                  },
                  child: const CustomHintText(
                      title: AppStrings.termsAndCondition))),
          // const Spacer(),
          SizedBox(height: 85.h),

          CustomBottomPhrase(
            text1: AppStrings.areadyHaveAnaccount,
            text2: AppStrings.login,
            onPressed: () {
              Navigator.pushNamed(context, Routes.loginViewRoute);
            },
          ),
          _buildPhoneNumberSubmitedBloc(),
        ],
      ),
    );
  }

  _buildNameTextField() {
    return DefaultTextField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'ادخل الاسم';
        }
        return null;
      },
      controller: _nameController,
      hint: AppStrings.name,
      prefix: Image.asset(ImageAssets.user,
          // color: ColorManager.darkSeconadry,
          width: 16.w,
          height: 16.h,
          fit: BoxFit.scaleDown),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Commons.showToast(message: 'من فضلك ادخل الـبيانات بشكل صحيح');
      // Navigator.pop(context);
      return;
    } else {
      // Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      BlocProvider.of<AuthCubit>(context).submitPhoneNumber(userPhone!);
    }
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<AuthCubit, AuthResultState>(
      listener: (context, state) {
        state.whenOrNull();
      },
      child: Container(),
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.registerNewAcc,
      onTap: () {
        setState(() {
          isLogin = false;
          userName = _nameController.text;

          userPhone = _phoneController.text;

          _register(context);
        });
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
