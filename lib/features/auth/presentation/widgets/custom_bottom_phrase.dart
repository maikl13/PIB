import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class CustomBottomPhrase extends StatelessWidget {
  const CustomBottomPhrase(
      {super.key, required this.text1, required this.text2, this.onPressed});
  final String text1;
  final String text2;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: getRegularStyle(fontSize: 12.sp, color: ColorManager.grey),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text2,
            style: getRegularStyle(
                    fontSize: 12.sp, color: ColorManager.darkSeconadry)
                .copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
