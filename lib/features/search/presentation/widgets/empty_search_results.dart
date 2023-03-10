import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class EmptySearchResults extends StatelessWidget {
  const EmptySearchResults({super.key});

  _buildImage() {
    return Image.asset(
      ImageAssets.emptySearch,
      width: 176.w,
      height: 143.h,
      fit: BoxFit.fill,
    );
  }

  _buildTitle() {
    return Text(
      AppStrings.emptySearch,
      style: getBoldStyle(fontSize: 16.sp, color: ColorManager.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImage(),
        SizedBox(height: 60.h),
        _buildTitle(),
      ],
    );
  }
}
