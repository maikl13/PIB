import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/features/pip/presentation/widgets/contact_button.dart';
import '../../../../core/resources/commons.dart';
import '../../business_logic/cubit/pip_cubit.dart';
import '../../data/models/driver_model.dart';

import '../../../../core/resources/color_manager.dart';

import '../../../../core/resources/style_manager.dart';
import '../../../home/presentation/widgets/image_with_stars.dart';

class FloatingDriversContainer extends StatelessWidget {
  const FloatingDriversContainer({super.key, required this.driverInfo});

  final DriverModel driverInfo;

  _buildFloatingContainer(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
        child: Container(
          height: 206.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorManager.black5,
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
            child: Column(
              children: [
                _buildFloatingContainerHeader(),
                SizedBox(height: 17.h),
                Divider(
                    color: ColorManager.grey.withOpacity(.5), thickness: 1.sp),
                SizedBox(height: 20.h),
                _buildFloatingContainerBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFloatingContainerHeader() {
    return Text('المشاوير المتاحة',
        style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white));
  }

  _buildFloatingContainerBody(BuildContext context) {
    return Container(
      height: 89.h,
      decoration: BoxDecoration(
          color: ColorManager.white.withOpacity(.10),
          borderRadius: BorderRadius.circular(10.r)),
      child: Stack(
        children: [
          _buildLeadingImage(),
          Padding(
            padding: EdgeInsets.only(top: 27.h, right: 97.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserName(),
                SizedBox(height: 9.h),
                Row(
                  children: [
                    _buildLocationIcon(),
                    SizedBox(width: 8.w),
                    _buildDistance(),
                  ],
                )
              ],
            ),
          ),
          _buildButton(context),
        ],
      ),
    );
  }

  _buildDistance() {
    return Text(
        'يبعد ${driverInfo.deliveryMan!.distance ?? ''} ددقائق عن مكان اللقاء',
        style: getRegularStyle(fontSize: 10.sp, color: ColorManager.grey));
  }

  _buildLocationIcon() {
    return Icon(Icons.location_on,
        color: ColorManager.darkSeconadry, size: 12.sp);
  }

  _buildUserName() {
    return Text(driverInfo.deliveryMan!.name ?? '',
        style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white));
  }

  _buildLeadingImage() {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, right: 12.w),
      child: SizedBox(
          width: 75.w,
          height: 65.w,
          child: ImageWithRating(
            image: driverInfo.deliveryMan!.imageUrl,
            height: 27.h,
          )),
    );
  }

  _buildButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 12.h, left: 15.w),
        child: Align(
            alignment: Alignment.topLeft,
            child: ContactButton(phoneNumber: driverInfo.deliveryMan!.phone!)));
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PipCubit>(context).stopStream();
    return _buildFloatingContainer(context);
  }
}
