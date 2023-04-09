import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/widgets/custom_title.dart';

import '../../business_logic/cubit/pip_cubit.dart';
import '../widgets/pick_request_item.dart';

class PickRequestTypeView extends StatefulWidget {
  const PickRequestTypeView({super.key});

  @override
  State<PickRequestTypeView> createState() => _PickRequestTypeViewState();
}

class _PickRequestTypeViewState extends State<PickRequestTypeView> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitle(title: AppStrings.chooseRequestType),
          SizedBox(height: 20.h),
          PickRequestItem(
            title: AppStrings.fastRequest,
            onTap: () {
              if (checkUserType(context)) {
                return;
              } else {
                Navigator.pushNamed(context, Routes.fastRequestViewRoute);
              }
            },
          ),
          SizedBox(height: 20.h),
          PickRequestItem(
            title: AppStrings.specialRequest,
            onTap: () {
              Navigator.pushNamed(context, Routes.specialRequestViewRoute);
            },
          ),
        ],
      ),
    );
  }
}
