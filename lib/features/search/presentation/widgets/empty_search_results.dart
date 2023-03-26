import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class EmptySearchResults extends StatelessWidget {
  const EmptySearchResults({super.key});

  _buildImage() {
    return Image.asset(
      ImageAssets.emptySearch,
      width: 176.w,
      height: 143.w,
      fit: BoxFit.contain,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImage(),
        SizedBox(height: 60.h),
        _buildTitle(),
      ],
    );
  }
}
