import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
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
  final TextEditingController phoneController = TextEditingController();

  late String phoneNumber;
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
              phoneNumber = value!;
            },
            controller: phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'invalid Number';
              } else if (value.length < 11) {
                return 'Too short for a phone number!';
              }
              return null;
            },
          ),
          SizedBox(height: 60.h),
          // _buildPasswordTextField(),
          SizedBox(height: 100.h),
          _buildButton(context),
          SizedBox(height: 22.h),
          const Center(
              child: CustomHintText(title: AppStrings.termsAndCondition)),
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
      hint: AppStrings.name,
      prefix: Icon(
        Icons.person,
        color: ColorManager.darkSeconadry,
        size: 20.sp,
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Commons.showToast(message: 'invalid nnumber');
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      BlocProvider.of<AuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<AuthCubit, AuthResultState>(
      listener: (context, state) {
        state.whenOrNull(
          phoneAuthLoading: () {
            showProgressIndicator(context);
          },
          phoneNumberSubmited: (uid) {
            print(uid);
            Navigator.pop(context);
            Navigator.of(context).pushNamed(Routes.confirmOtbViewRoute);
          },
          phoneAuthErrorOccurred: (errorMsg) {
            Navigator.pop(context);
            Commons.showToast(message: errorMsg);
          },
        );
      },
      child: Container(),
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.registerNewAcc,
      onTap: () {
        showProgressIndicator(context);

        // showSuccessDialog(
        //   context,
        //   onOk: () {
        //     Navigator.pushNamedAndRemoveUntil(
        //         context, Routes.mainHomeViewRoute, (route) => false);
        //   },
        // );
        _register(context);
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
