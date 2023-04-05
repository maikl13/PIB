import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/auth/business_logic/cubit/auth_cubit.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

import '../resources/color_manager.dart';

class SkipText extends StatelessWidget {
  const SkipText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.w),
      child: InkWell(
        onTap: () {
          
          BlocProvider.of<AuthCubit>(context).signInAnonymously();
          // Navigator.of(context).pushNamed(Routes.mainHomeViewRoute);
        },
        child: Text(
          AppStrings.skip,
          style: getBoldStyle(
            color: ColorManager.darkSeconadry,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
