import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../business_logic/global_cubit.dart';
import '../business_logic/global_state.dart';
import '../resources/assets_manager.dart';
import 'notification_warning.dart';
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

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with WidgetsBindingObserver {
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // BlocProvider.of<ChatCubit>(context).stopStream();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<GlobalCubit>(context).startMessagesCountStream();
    } else if (state == AppLifecycleState.inactive) {
      BlocProvider.of<GlobalCubit>(context)
          .stopStream(); // this is called when the app is in background
    } else if (state == AppLifecycleState.paused) {
      BlocProvider.of<GlobalCubit>(context)
          .stopStream(); // this is called when the app is in background
    } else if (state == AppLifecycleState.inactive) {
      BlocProvider.of<GlobalCubit>(context)
          .stopStream(); // this is called when the app is in background
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 5 , bottom: 5),
      color: ColorManager.lightBlack,
      child: BottomNavigationBar(
        // selectedItemColor: Theme.of(contex,
        type: BottomNavigationBarType.fixed, // This is all you need!
        selectedLabelStyle: TextStyle(fontSize: 10),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(bottom: 5),
              child: Image.asset(
                widget.selectedIndex == 0
                    ? ImageAssets.selectedHouse
                    : ImageAssets.solidHome,
                color: widget.selectedIndex == 0
                    ? ColorManager.darkSeconadry
                    : ColorManager.grey,

                height: 20,
                width: 20,
              ),
            ),
            label: AppStrings.main,
          ),
          BottomNavigationBarItem(
            icon: Container(

              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                AppStrings.pib,
                style: getBoldStyle(
                    fontSize: 16.sp,
                    color: screenIndex == 1
                        ? ColorManager.darkSeconadry
                        : ColorManager.grey),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(bottom: 5),
              child: Image.asset(
                  height: 20,
                  width: 20,
                  widget.selectedIndex == 2
                      ? ImageAssets.solidLayers
                      : ImageAssets.layers,
                  color: widget.selectedIndex == 2
                      ? ColorManager.darkSeconadry
                      : ColorManager.grey),

            ),
            label: AppStrings.myOrders,
          ),
          BottomNavigationBarItem(
            icon:Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(bottom: 5),
              child:  Stack(
                children: [
                  Image.asset(
                    widget.selectedIndex == 3
                        ? ImageAssets.solidComments
                        : ImageAssets.comments,
                    height: 20,
                    width: 20,
                  ),
                  BlocBuilder<GlobalCubit, GlobalState>(
                    buildWhen: (previous, current) =>
                    current is NewMessage || current is ReadMessage,
                    builder: (context, state) {
                      return Visibility(
                        visible: state is NewMessage ? true : false,
                        child: Positioned(
                          left: 13.w,
                          // padding: EdgeInsets.only(left: 16.w),
                          child: const NotificationWarning(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            label: AppStrings.messages,
          ),
          BottomNavigationBarItem(


            icon: Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(bottom: 5),
              child: BlocProvider.value(
                value: RouteGenerator.menuCubit,
                child: BlocConsumer<MenuCubit, MenuState>(
                  listener: (context, state) {},

                  buildWhen: (previous, current) =>
                  current is GetUserInfoSuccess ||
                      current is UpdateUserInfoSuccess,
                  builder: (context, state) {
                    return state.maybeWhen(

                        getUserInfoSuccess: (userInfo) {
                          return CircleAvatar(
                              radius: 12.5.h,

                              child: ClipOval(
                                child: CustomNetworkCachedImage(
                                    url: userInfo.imageUrl ??
                                        'https://th.bing.com/th/id/OIP.8R95WJtQhwmzvFvd75zrVQHaHa?pid=ImgDet&w=1490&h=1490&rs=1'),
                              ));
                        },
                        orElse: () => CircleAvatar(
                            radius: 12.5.h,
                            child: ClipOval(
                              child: CustomNetworkCachedImage(url: userImage),
                            )));
                  },
                ),
              ),
            ),

            label: AppStrings.personalInfo,
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: widget.onTap!,
      ),
    );
  }
}
