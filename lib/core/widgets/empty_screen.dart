import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/assets_manager.dart';
import '../resources/style_manager.dart';

import '../resources/color_manager.dart';

class EmptyScreen extends StatelessWidget {
  final String? message;
  final double height;
  const EmptyScreen({Key? key, this.message, this.height = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            ImageAssets.noData,
            height: height,
          ),
        ),
        Text('لا يوجد بيانات حاليا',
            textAlign: TextAlign.center,
            style: getBoldStyle(fontSize: 20.sp, color: ColorManager.darkGrey)),
      ],
    );
  }
}
