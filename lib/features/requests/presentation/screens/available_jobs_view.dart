import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_title.dart';
import '../widgets/request_item.dart';

class AvailableJobsView extends StatelessWidget {
  const AvailableJobsView({super.key});
  _buildList() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(height: 12.h);
      },
      itemBuilder: (context, index) {
        return RequestItem(
          onTap: () {
            Navigator.pushNamed(context, Routes.availableJobDetailsViewRoute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 37.h),
      shrinkWrap: true,
      children: [
        const CustomTitle(title: AppStrings.recievedRequests),
        SizedBox(height: 20.h),
        _buildList(),
      ],
    );
  }
}
