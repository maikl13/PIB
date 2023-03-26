import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import '../resources/route_manager.dart';
import 'custom_network_image.dart';
import '../../features/menu/business_logic/menu_cubit.dart';
import '../../features/menu/business_logic/menu_state.dart';
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
        BottomNavigationBarItem(
          icon: Image.asset(
            widget.selectedIndex == 0
                ? ImageAssets.selectedHouse
                : ImageAssets.solidHome,
            color: widget.selectedIndex == 0
                ? ColorManager.darkSeconadry
                : ColorManager.grey,
          ),
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
        BottomNavigationBarItem(
          icon: Image.asset(
              widget.selectedIndex == 2
                  ? ImageAssets.solidLayers
                  : ImageAssets.layers,
              color: widget.selectedIndex == 2
                  ? ColorManager.darkSeconadry
                  : ColorManager.grey),
          label: AppStrings.myOrders,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            widget.selectedIndex == 3
                ? ImageAssets.solidComments
                : ImageAssets.comments,
          ),
          label: AppStrings.messages,
        ),
        BottomNavigationBarItem(
          icon: BlocProvider.value(
            value: RouteGenerator.menuCubit,
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {},
              builder: (context, state) {
                return CircleAvatar(
                    radius: 12.5.h,
                    child: ClipOval(
                      child: CustomNetworkCachedImage(url: userImage),
                    ));
              },
            ),
          ),
          label: AppStrings.personalInfo,
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onTap!,
    );
  }
}
