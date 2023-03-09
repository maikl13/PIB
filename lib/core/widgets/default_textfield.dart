import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField(
      {super.key,
      this.suffix,
      this.hint,
      this.contentPadding,
      this.validator,
      this.onSaved,
      this.controller,
      this.prefix});

  final Widget? suffix;
  final Widget? prefix;
  final String? hint;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onSaved: widget.onSaved,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(top: 12.h, bottom: 11.h, right: 20.w),
        hintText: widget.hint,
        prefixIcon: widget.prefix,
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 0.h, left: 20.w),
          child: widget.suffix,
        ),
      ),
    );
  }
}
