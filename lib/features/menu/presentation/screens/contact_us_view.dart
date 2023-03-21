import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/custom_title.dart';
import 'package:pip/core/widgets/default_button.dart';
import 'package:pip/core/widgets/default_phone_textfield.dart';
import 'package:pip/features/menu/business_logic/menu_cubit.dart';
import 'package:pip/features/menu/business_logic/menu_state.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../pip/presentation/widgets/request_custom_tetfield.dart';
import '../widgets/contact_us_info_item.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  _buildBody(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w, bottom: 40.h),
      shrinkWrap: true,
      children: [
        _buildHowToContactUs(),
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

  _buildHowToContactUs() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
          getSettingLoading: () {
            return const LoadingIndicator();
          },
          getSettingSuccess: (setting) {
            return Column(
              children: [
                _buildInfo(
                  userPhone: setting[2].value,
                  userEmail: setting[1].value,
                ),
                SizedBox(height: 40.h),
                _buildSocialMedia(
                  facebookLink: setting[4].value!,
                  twitterLink: setting[5].value!,
                  instagramLink: setting[3].value!,
                ),
                SizedBox(height: 40.h),
              ],
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
        text: AppStrings.send,
        onTap: () {
          // showContactSuccessDialog(
          //   context,
          //   onOk: () {
          //     Navigator.pop(context);
          //   },
          // );
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

  _buildInfo({String? userPhone, String? userEmail}) {
    return Row(
      children: [
        Expanded(
          child: ContactUsInfoItem(
            title: userEmail ?? '',
            icon: Icons.email_outlined,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ContactUsInfoItem(
            title: userPhone ?? '',
            icon: Icons.phone_enabled_outlined,
          ),
        ),
      ],
    );
  }

  _buildSocialMedia(
      {String instagramLink = 'https://www.instagram.com/',
      String twitterLink = 'https://twitter.com/',
      String facebookLink = 'https://www.facebook.com/'}) {
    return Center(
      child: SizedBox(
        width: 125.w,
        height: 18.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Commons.openUrl(instagramLink);
              },
              child: FaIcon(
                FontAwesomeIcons.instagram,
                color: ColorManager.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Commons.openUrl(twitterLink);
              },
              child: FaIcon(
                FontAwesomeIcons.twitter,
                color: ColorManager.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Commons.openUrl(facebookLink);
              },
              child: FaIcon(
                FontAwesomeIcons.facebookF,
                color: ColorManager.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MenuCubit>(context).getAllSettings();
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
