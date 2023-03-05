import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key, required this.text, this.height, this.widht, this.onTap, this.color});
  final String text;
  final double? height;
  final double? widht;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: widht ?? double.infinity,
        height: height ?? 49.h,
        decoration: BoxDecoration(
            color: color?? Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
