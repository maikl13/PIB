import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'default_textfield.dart';
import 'headline.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.icon,
      required this.title,
      required this.suffix,
      required this.hint,
      this.contentPadding, this.iconHeight, this.iconWidth, this.validator, this.onSaved});

  final String icon;
  final String title;
  final Widget suffix;
  final String hint;
  final double? iconHeight;
  final double? iconWidth;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String?)? onSaved;

 final String? Function(String?)? validator;

  _buildPhoneTextField() {
    return Column(
      children: [
        Headline(title: title, icon: icon,
            iconHeight: iconHeight, iconWidth: iconWidth,
        ),
        SizedBox(height: 15.h),
        _buildInputField(),
      ],
    );
  }

  _buildInputField() {
    return DefaultTextField(
      onSaved: onSaved,
      suffix: suffix,
      hint: hint,
      contentPadding: contentPadding,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPhoneTextField();
  }
}
