import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/models/setting_model.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_phone_textfield.dart';
import '../../business_logic/menu_cubit.dart';
import '../../business_logic/menu_state.dart';

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
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _buildBody(BuildContext context) {
    return BlocListener<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          sendComplainLoading: () {
            Commons.showLoadingDialog(context);
          },
          sendComplainSuccess: (data) {
            // BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();

            Navigator.pop(context);
            showContactSuccessDialog(
              context,
              onOk: () {
                Navigator.pop(context);
                _descriptionController.clear();
                _phoneController.clear();
                Navigator.pop(context);
              },
            );
          },
          sendComplainError: (error) {
            Navigator.pop(context);
            Commons.showToast(message: error.toString());
          },
        );
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w, bottom: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // shrinkWrap: true,
              children: [
                _buildHowToContactUs(),
                _builDivider(),
                SizedBox(height: 46.h),
                const CustomTitle(title: AppStrings.giveYourComplain),
                SizedBox(height: 20.h),
                DefaultPhoneTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'من فضلك ادخل القيمة';
                    }
                    return null;
                  },
                  controller: _phoneController,
                ),
                SizedBox(height: 40.h),
                _buildDescriptionTextField(),
                SizedBox(height: 150.h),
                _buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildHowToContactUs() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          getSettingError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
        );
      },
      buildWhen: (previous, current) => current is GetSettingSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          getSettingLoading: () {
            return const LoadingIndicator();
          },
          getSettingSuccess: (setting) {
            return _buildSettings(setting);
          },
          orElse: () =>
              _buildSettings(BlocProvider.of<MenuCubit>(context).allSettings),
        );
      },
    );
  }

  _buildSettings(List<SettingModel> setting) {
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
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
        text: AppStrings.send,
        onTap: () {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<MenuCubit>(context).sendComplain(
                _phoneController.text, _descriptionController.text);
          }
        });
  }

  _builDivider() {
    return Divider(
      color: ColorManager.grey,
      thickness: 1.sp,
    );
  }

  _buildDescriptionTextField() {
    return RequestCustomTextField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      hint: AppStrings.description,

      circleAvatar: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      controller: _descriptionController,
      bottomPadding: 40.h,
      topPadding: 0.h,
      maxLines: 3,
      label: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppStrings.description,
                style:
                    getBoldStyle(fontSize: 15.sp, color: ColorManager.grey5)),
          ],
        ),
      ),
      // hint: AppStrings.description,
      icon: ImageAssets.title,
    );
  }

  _buildInfo({String? userPhone, String? userEmail}) {
    return Row(
      children: [
        Expanded(
          child: ContactUsInfoItem(
            onTap: () {
              Commons.openUrl('mailto://$userEmail');
            },
            title: userEmail ?? 'لا يوجد بريد الكتروني',
            widget: Icon(
              Icons.email,
              color: ColorManager.white,
              size: 18.sp,
            ),
            // icon: ImageAssets.envelope,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ContactUsInfoItem(
            onTap: () {
              Commons.openUrl('tel://$userPhone');
            },
            title: userPhone ?? 'لا يوجد رقم هاتف',
            icon: ImageAssets.phone,
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
    // BlocProvider.of<MenuCubit>(context).getAllSettings();
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
