import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/default_button.dart';

import '../../../../core/resources/style_manager.dart';
import '../widgets/request_custom_tetfield.dart';

class OrderDescriptionView extends StatefulWidget {
  const OrderDescriptionView({super.key, this.title});

  final String? title;

  @override
  State<OrderDescriptionView> createState() => _OrderDescriptionViewState();
}

class _OrderDescriptionViewState extends State<OrderDescriptionView> {
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            EdgeInsets.only(right: 20.w, left: 20, bottom: 30.h, top: 30.h),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 30.h),
            _buildLogo(),
            SizedBox(height: 50.h),
            _buildDescriptionTextField(),
            SizedBox(height: 50.h),
            DefaultButton(
              text: 'التالي',
              onTap: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                description = _descriptionController.text;
                Navigator.pushReplacementNamed(
                    context, Routes.chooseTaxiViewRoute,
                    arguments: {
                      'title': widget.title,
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: 'قم ب كتابه بعض التفاصيل عن ',
            style: getBoldStyle(
                fontSize: 28.sp, color: ColorManager.darkSeconadry)),
        WidgetSpan(child: SizedBox(width: 12.w)),
        TextSpan(
            text: 'الطلب الخاص بك',
            style: getBoldStyle(fontSize: 28.sp, color: ColorManager.white)),
      ]),
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

  _buildDescriptionTextField() {
    return RequestCustomTextField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل الوصف للطلب الخاص بك';
        }
        return null;
      },
      // contentPadding: EdgeInsets.only(top: 15.h, bottom: 60.h),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      controller: _descriptionController,
      bottomPadding: 40.h,
      hint: AppStrings.description,

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        actions: const [],
      ),
      body: _buildBody(context),
    );
  }
}





/*

 
  } */