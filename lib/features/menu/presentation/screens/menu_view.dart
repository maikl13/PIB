import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/dark_default_button.dart';
import 'package:pip/features/home/presentation/widgets/job_rate_container.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../widgets/menu_item.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 40.h),
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            _buildProfileImage(),
            SizedBox(height: 27.h),
            _buildUserName(),
            SizedBox(height: 17.h),
            _buildPhoneNumber(),
            SizedBox(height: 32.h),
            _buildEditButton(),
          ],
        ),
        _buildList(),
      ],
    );
  }

  _buildEditButton() {
    return DarkDefaultButton(
      widht: 195.w,
      height: 39.h,
      textStyle:
          getRegularStyle(fontSize: 15.sp, color: ColorManager.darkSeconadry),
      text: AppStrings.editData,
      borderColor: ColorManager.darkSeconadry,
    );
  }

  _buildPhoneNumber() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppStrings.zeros,
            style: getLightStyle(fontSize: 13.sp, color: ColorManager.grey)),
        const SizedBox(width: 15),
        Icon(
          Icons.phone_enabled_outlined,
          color: ColorManager.grey,
        ),
      ],
    );
  }

  _buildUserName() {
    return Text(AppStrings.userName,
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildProfileImage() {
    return SizedBox(
        width: 103.h,
        height: 103.h,
        child: Stack(
          // fit: StackFit.expand,
          children: [
            _buildImage(),
            const Align(
                alignment: Alignment.bottomLeft, child: JobRateContainer()),
          ],
        ));
  }

  _buildImage() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 103.h,
        height: 103.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorManager.darkSeconadry, width: 3.sp),
        ),
        child: CircleAvatar(
          backgroundColor: ColorManager.black,
          backgroundImage: const AssetImage(
            ImageAssets.banner,
          ),
        ),
      ),
    );
  }

  _buildList() {
    return ListView.separated(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return MenuViewItem(
            title: menuViewItemTitles[index],
            icon: menuViewItemIcons[index],
            index: index,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: menuViewItemIcons.length);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
