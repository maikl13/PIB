import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/business_logic/global_cubit.dart';
import 'package:pip/core/business_logic/global_state.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';

class FloatingConfirmDestenation extends StatefulWidget {
  const FloatingConfirmDestenation(
      {super.key,
      required this.onTap,
      required this.address,
      required this.buttonTitle,
      required this.headerTitle});
  final String headerTitle;
  final String address;
  final void Function() onTap;
  final String buttonTitle;

  @override
  State<FloatingConfirmDestenation> createState() =>
      _FloatingConfirmDestenationState();
}

class _FloatingConfirmDestenationState
    extends State<FloatingConfirmDestenation> {
  _buildFloatingContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
        child: Container(
          height: 219.h,
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
                _buildFloatingContainerBody(),
                SizedBox(height: 24.h),
                DefaultButton(
                  text: widget.buttonTitle,
                  onTap: widget.onTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFloatingContainerHeader() {
    return Text(widget.headerTitle,
        style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white));
  }

  _buildFloatingContainerBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<GlobalCubit, GlobalState>(
          buildWhen: (previous, current) => current is MyDestenationChange,
          builder: (context, state) {
            return Flexible(
              child: Text(
                state.maybeWhen(
                    myDestenationChange: (address) {
                      return address;
                    },
                    orElse: () => ''),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getBoldStyle(
                    fontSize: 13.sp, color: ColorManager.darkSeconadry),
              ),
            );
          },
        ),
        // Container(
        //   width: 62.w,
        //   height: 31.h,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(31.r),
        //       color: ColorManager.white.withOpacity(.2)),
        //   child: Center(
        //     child: Text(
        //       AppStrings.search,
        //       style: getBoldStyle(fontSize: 10.sp, color: ColorManager.white),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFloatingContainer();
  }
}
