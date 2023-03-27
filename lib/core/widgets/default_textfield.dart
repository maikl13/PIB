import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/style_manager.dart';
import '../resources/color_manager.dart';

class DefaultTextField extends StatefulWidget {
  const   DefaultTextField(
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
      this.isPassword,
      this.floatingLabelBehavior,
      this.label, this.inputFormatters});

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
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      
      onTap: () {
        if (widget.controller!.selection ==
            TextSelection.fromPosition(
                TextPosition(offset: widget.controller!.text.length - 1))) {
          setState(() {
            widget.controller!.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller!.text.length));
          });
        }
      },
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
      // autofocus: true,
      decoration: InputDecoration(
        isDense: true,
        label: widget.label,
        floatingLabelBehavior:
            widget.floatingLabelBehavior ?? FloatingLabelBehavior.never,
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(top: 12.h, bottom: 11.h, right: 14.w),
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
