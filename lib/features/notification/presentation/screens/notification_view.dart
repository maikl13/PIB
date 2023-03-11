import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../widgets/notification_item.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  Widget _buildNotificationViewBody() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return const NotificationItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 15.h);
          },
          itemCount: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        actions: const [],
        title: AppStrings.notification,
      ),
      body: _buildNotificationViewBody(),
    );
  }
}
