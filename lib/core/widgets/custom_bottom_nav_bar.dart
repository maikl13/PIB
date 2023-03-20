import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/widgets/custom_network_image.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants.dart';
import '../resources/style_manager.dart';

import '../resources/strings_manager.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar(
      {super.key, required this.onTap, required this.selectedIndex});
  final void Function(int index)? onTap;
  final int selectedIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // selectedItemColor: Theme.of(contex,
      type: BottomNavigationBarType.fixed, // This is all you need!

      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: AppStrings.main,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              AppStrings.pib,
              style: getBoldStyle(
                  fontSize: 16.sp,
                  color: selectedTab == 1
                      ? ColorManager.darkSeconadry
                      : ColorManager.grey),
            ),
          ),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.layers_outlined),
          label: AppStrings.myOrders,
        ),
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_2),
          label: AppStrings.messages,
        ),
        BottomNavigationBarItem(
          icon: userImage == null
              ? Image.asset(ImageAssets.userImage, height: 25.h)
              : CircleAvatar(
                  radius: 12.5.h,
                  child: ClipOval(
                    child: CustomNetworkCachedImage(url: userImage!),
                  )),
          label: AppStrings.personalInfo,
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onTap!,
    );
  }
}
