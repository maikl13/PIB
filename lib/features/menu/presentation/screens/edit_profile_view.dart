import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/menu_cubit.dart';
import '../../business_logic/menu_state.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/default_phone_textfield.dart';
import '../../../../core/widgets/default_textfield.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _buildBody(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuState>(
        listener: (context, state) {
          state.whenOrNull(
            updateUserInfoLoading: () {
              Commons.showLoadingDialog(context);
            },
            updateUserInfoSuccess: (data) {
              Navigator.pop(context);
              Commons.showToast(
                  message: 'تم تغير البيانات بنجاح', color: ColorManager.green);
              BlocProvider.of<MenuCubit>(context).getUserInfo();
              Navigator.pop(context);
            },
            updateUserInfoError: (error) {
              Commons.showToast(
                  message: NetworkExceptions.getErrorMessage(error));
            },
          );
        },
        buildWhen: (previous, current) => current is GetUserInfoSuccess,
        builder: (context, state) {
          return state.maybeWhen(
            getUserInfoLoading: () {
              return const LoadingIndicator();
            },
            getUserInfoSuccess: (userInfo) {
              _nameController.text = userInfo.name ?? '';
              _emailController.text = userInfo.email ?? '';
              _phoneController.text = userInfo.phone ?? '';
              return _buildForm();
            },
            orElse: () => Container(),
          );
        });
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: ListView(
        padding:
            EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w, bottom: 20.h),
        shrinkWrap: true,
        children: [
          _buildProfileImage(context),
          SizedBox(height: 49.h),
          _buildNameTextField(),
          SizedBox(height: 20.h),
          DefaultPhoneTextField(
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'برجاء ادخال البيانات';
              }
              return null;
            },
            controller: _phoneController,
          ),
          SizedBox(height: 20.h),
          _buildEmailTextField(),
          SizedBox(height: 192.h),
          _buildButton(context),
        ],
      ),
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.editData,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          BlocProvider.of<MenuCubit>(context).updateProfile(
              _nameController.text,
              _emailController.text,
              _phoneController.text);
        }
      },
    );
  }

  _buildProfileImage(BuildContext context) {
    return SizedBox(
        width: 103.h,
        height: 103.h,
        child: Stack(
          // fit: StackFit.expand,
          children: [
            _buildImage(context),
            _buildEditButton(context),
          ],
        ));
  }

  _buildImage(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          updateUserInfoSuccess: (data) {
            BlocProvider.of<MenuCubit>(context).imageFile = null;
          },
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 103.h,
                height: 103.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: ColorManager.darkSeconadry, width: 3.sp),
                ),
                child: CircleAvatar(
                    backgroundColor: ColorManager.black,
                    child: ClipOval(
                      child: CustomNetworkCachedImage(
                        url: userImage,
                      ),
                    )),
              ),
            ),
            if (BlocProvider.of<MenuCubit>(context).imageFile != null)
              Padding(
                padding: EdgeInsets.only(top: 70.h, right: 60.w),
                child: Center(
                  child: SizedBox(
                    width: 55.w,
                    height: 55.h,
                    child: CircleAvatar(
                        backgroundImage: FileImage(
                      BlocProvider.of<MenuCubit>(context).imageFile!,
                    )),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  _buildEditButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          BlocProvider.of<MenuCubit>(context).pickImage();
        },
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
      validator: (p0) {
        if (p0!.isEmpty) {
          return 'برجاء ادخال البيانات';
        }
        return null;
      },
      controller: _nameController,
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
        validator: (p0) {
          if (p0!.isEmpty) {
            return 'برجاء ادخال البيانات';
          }
          return null;
        },
        controller: _emailController,
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
