import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../pip/presentation/widgets/request_custom_tetfield.dart';

class ChatAddOfferViewRoute extends StatelessWidget {
  const ChatAddOfferViewRoute({super.key});

  _buildBody(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h, bottom: 35.h),
      children: [
        const CustomTitle(title: AppStrings.chooseType),
        SizedBox(height: 20.h),
        _buildJobNameTextField(),
        SizedBox(height: 20.h),
        _buildPriceTextField(),
        SizedBox(height: 20.h),
        _buildTimeToCompleteTextField(),
        SizedBox(height: 320.h),
        _buildButton(context),
      ],
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.send,
      onTap: () {
        showSuccessAddOfferInChatDialog(
          context,
          onOk: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  _buildPriceTextField() {
    return const RequestCustomTextField(
      hint: AppStrings.price,
      icon: FontAwesomeIcons.tags,
    );
  }

  _buildJobNameTextField() {
    return const RequestCustomTextField(
      hint: AppStrings.jobName,
      icon: Icons.title,
    );
  }

  _buildTimeToCompleteTextField() {
    return RequestCustomTextField(
      suffix: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 10.h),
        child: Text(AppStrings.days,
            style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white)),
      ),
      hint: AppStrings.timeToComplete,
      icon: FontAwesomeIcons.solidClock,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.addOffer,
        actions: const [],
      ),
      body: _buildBody(context),
    );
  }
}
