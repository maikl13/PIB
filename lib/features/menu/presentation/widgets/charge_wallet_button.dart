import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../business_logic/menu_cubit.dart';

class ChargeWalletButton extends StatefulWidget {
  const ChargeWalletButton({super.key});

  @override
  State<ChargeWalletButton> createState() => _ChargeWalletButtonState();
}

class _ChargeWalletButtonState extends State<ChargeWalletButton> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _buildChargeButton(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<MenuCubit>(context).showWalletAddAmountDialog(
          context,
          _formKey,
          onTap: () {
            BlocProvider.of<MenuCubit>(context).addAmountToWallet();
          },
        );
      },
      child: Container(
        width: 138.w,
        height: 37.h,
        decoration: BoxDecoration(
            // color: ColorManager.white.withOpacity(.1),
            border: Border.all(
                color: const Color.fromRGBO(133, 133, 133, 0.26), width: .5.sp),
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPlusIcon(),
              SizedBox(width: 4.w),
              _buildTitle(),
            ],
          ),
        ),
      ),
    );
  }

  _buildPlusIcon() {
    return Icon(
      Icons.add,
      color: ColorManager.darkSeconadry,
      size: 14.sp,
    );
  }

  _buildTitle() {
    return Text(
      AppStrings.chargeWallet,
      style: getRegularStyle(color: ColorManager.white, fontSize: 12.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChargeButton(context);
  }
}