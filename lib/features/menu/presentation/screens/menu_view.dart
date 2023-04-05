import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../chat/business_logic/chat_cubit.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/location_helper.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/shared_prefrences.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../pip/business_logic/cubit/pip_cubit.dart';
import '../../business_logic/menu_cubit.dart';
import '../../business_logic/menu_state.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../widgets/menu_item.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  static Position? position;

  _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 40.h),
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            _buildUserInfo(),
            SizedBox(height: 32.h),
            _buildEditButton(context),
          ],
        ),
        _buildList(),
      ],
    );
  }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation();
    if (position == null) {
      // Handle the case where the user cancels the permission request

      // ignore: use_build_context_synchronously
      BlocProvider.of<PipCubit>(context).toggleFastRequest();
      print("User cancelled permission to access location services");
    } else {
      setState(() {});
      print("position: $position");
    }
  }

  _buildUserInfo() {
    return BlocConsumer<MenuCubit, MenuState>(
        listener: (context, state) {
          state.whenOrNull(
            signOutSuccess: () {
              BlocProvider.of<GlobalCubit>(context).stopStream();
              BlocProvider.of<ChatCubit>(context).stopStream();

            },
          );
        },
        buildWhen: (previous, current) => current is GetUserInfoSuccess,
        builder: (context, state) {
          return state.maybeWhen(
            getUserInfoLoading: () {
              return const LoadingIndicator();
            },
            getUserInfoSuccess: (userInfo) {
              userImage = userInfo.imageUrl ??
                  'https://th.bing.com/th/id/OIP.8R95WJtQhwmzvFvd75zrVQHaHa?pid=ImgDet&w=1490&h=1490&rs=1';
              userName = userInfo.name;
              userPhone = userInfo.phone;
              userEmail = userInfo.email;

              CacheHelper.saveData(key: 'userImage', value: userImage);
              CacheHelper.saveData(key: 'userName', value: userName);
              CacheHelper.saveData(key: 'userPhone', value: userPhone);
              return _buildUserPar(userInfo.imageUrl ?? '', userInfo.name ?? '',
                  userInfo.phone ?? AppStrings.zeros);
            },
            orElse: () {
              return _buildUserPar(
                  userImage ??
                      'https://th.bing.com/th/id/OIP.8R95WJtQhwmzvFvd75zrVQHaHa?pid=ImgDet&w=1490&h=1490&rs=1',
                  userName ?? '',
                  userPhone ?? AppStrings.zeros);
            },
          );
        });
  }

  _buildUserPar(String image, String name, String phone) {
    return Column(
      children: [
        _buildProfileImage(image),
        SizedBox(height: 27.h),
        _buildUserName(name),
        SizedBox(height: 17.h),
        _buildPhoneNumber(phone),
      ],
    );
  }

  _buildEditButton(BuildContext context) {
    return DarkDefaultButton(
      widht: 195.w,
      height: 39.h,
      textStyle:
          getRegularStyle(fontSize: 15.sp, color: ColorManager.darkSeconadry),
      text: AppStrings.editData,
      borderColor: ColorManager.darkSeconadry,
      onTap: () {
        // BlocProvider.of<MenuCubit>(context).getUserInfo();
        Navigator.pushNamed(context, Routes.editProfileViewRoute);
      },
    );
  }

  _buildPhoneNumber(String? phone) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(phone ?? 'لا يوجد رقم هاتف',
            style: getLightStyle(fontSize: 13.sp, color: ColorManager.grey)),
        const SizedBox(width: 15),
        Image.asset(
          ImageAssets.solidPhone,
          // color: ColorManager.grey,
        ),
      ],
    );
  }

  _buildUserName(String? name) {
    return Text(name ?? '',
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildProfileImage(String? imageUrl) {
    return SizedBox(
        width: 103.w,
        height: 103.w,
        child: Stack(
          // fit: StackFit.expand,
          children: [
            _buildImage(imageUrl),
            // const Align(
            //     alignment: Alignment.bottomLeft, child: JobRateContainer()),
          ],
        ));
  }

  _buildImage(String? imageUrl) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 103.w,
        height: 103.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorManager.darkSeconadry, width: 3.sp),
        ),
        child: CircleAvatar(
          backgroundColor: ColorManager.black,
          child: ClipOval(
            child: CustomNetworkCachedImage(url: imageUrl),
          ),
        ),
      ),
    );
  }

  _buildList() {
    return ListView.separated(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h, bottom: 30.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return MenuViewItem(
            title: menuViewItemTitles[index],
            icon: menuViewItemIcons[index],
            index: index,
            onTap: () {
              index == menuViewItemRoutes.length - 1
                  ? BlocProvider.of<MenuCubit>(context).signOut(context)
                  : Navigator.pushNamed(context, menuViewItemRoutes[index]);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: menuViewItemTitles.length);
  }

  @override
  void initState() {
    super.initState();

    // BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
