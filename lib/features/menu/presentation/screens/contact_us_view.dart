import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/custom_title.dart';
import 'package:pip/core/widgets/default_button.dart';
import 'package:pip/core/widgets/default_phone_textfield.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../pip/presentation/widgets/request_custom_tetfield.dart';
import '../widgets/contact_us_info_item.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  _buildBody(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w, bottom: 40.h),
      shrinkWrap: true,
      children: [
        _buildInfo(),
        SizedBox(height: 40.h),
        _buildSocialMedia(),
        SizedBox(height: 40.h),
        _builDivider(),
        SizedBox(height: 46.h),
        const CustomTitle(title: AppStrings.giveYourComplain),
        SizedBox(height: 20.h),
        const DefaultPhoneTextField(),
        SizedBox(height: 40.h),
        _buildDescriptionTextField(),
        SizedBox(height: 150.h),
        _buildButton(context),
      ],
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
        text: AppStrings.send,
        onTap: () {
          showContactSuccessDialog(
            context,
            onOk: () {
              Navigator.pop(context);
            },
          );
        });
  }

  _builDivider() {
    return Divider(
      color: ColorManager.grey,
      thickness: 1.sp,
    );
  }

  _buildDescriptionTextField() {
    return const RequestCustomTextField(
      bottomPadding: 70,
      maxLines: 3,
      hint: AppStrings.description,
      icon: Icons.text_fields_outlined,
    );
  }

  _buildInfo() {
    return Row(
      children: const [
        Expanded(
          child: ContactUsInfoItem(
            title: AppStrings.userEmail,
            icon: Icons.email_outlined,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: ContactUsInfoItem(
            title: '01000000000',
            icon: Icons.phone_enabled_outlined,
          ),
        ),
      ],
    );
  }

  _buildSocialMedia() {
    return Center(
      child: SizedBox(
        width: 125.w,
        height: 18.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(
              FontAwesomeIcons.instagram,
              color: ColorManager.grey,
            ),
            FaIcon(
              FontAwesomeIcons.twitter,
              color: ColorManager.grey,
            ),
            FaIcon(
              FontAwesomeIcons.facebookF,
              color: ColorManager.grey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.contactUs,
        actions: const [],
      ),
      body: _buildBody(context),
    );
  }
}
