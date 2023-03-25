import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/style_manager.dart';
import '../resources/color_manager.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField(
      {super.key,
      this.suffix,
      this.hint,
      this.contentPadding,
      this.validator,
      this.onSaved,
      this.controller,
      this.prefix,
      this.style,
      this.maxLines,
      this.hintStyle,
      this.keyboardType,
      this.isPassword,  this.floatingLabelBehavior, this.label});

  final Widget? suffix;
  final Widget? prefix;
  final String? hint;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextStyle? style;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? label;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines ?? 1,
      cursorColor: ColorManager.darkSeconadry,
      style: widget.style ??
          getBoldStyle(
            color: ColorManager.darkGrey,
            fontSize: 18.sp,
          ),
          
      obscureText: widget.isPassword ?? false,
      controller: widget.controller,
      onSaved: widget.onSaved,
      validator: widget.validator,
      decoration: InputDecoration(
        label: widget.label,
                floatingLabelBehavior: widget.floatingLabelBehavior,

        contentPadding: widget.contentPadding ??
            EdgeInsets.only(top: 12.h, bottom: 11.h, right: 20.w),
        hintText: widget.hint,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefix,
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 0.h, left: 20.w),
          child: widget.suffix,
        ),
      ),
    );
  }
}
