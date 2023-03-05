import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField(
      {super.key,
      required this.suffix,
      required this.hint,
      this.contentPadding,
      this.validator, this.onSaved});

  final Widget suffix;
  final String hint;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(top: 14.h, bottom: 13.h, right: 20.w),
        hintText: widget.hint,
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 0.h, left: 20.w),
          child: widget.suffix,
        ),
      ),
    );
  }
}
