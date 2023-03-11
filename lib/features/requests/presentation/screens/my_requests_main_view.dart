import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'available_jobs_view.dart';
import 'wanted_job_requests_view.dart';

import '../widgets/custom_tab_bar.dart';

class MyRequestsMainView extends StatelessWidget {
  const MyRequestsMainView({super.key});
  _buildBody() {
    return DefaultTabController(
        length: 2,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const CustomTabBar(),
            _buildTabBarBody(),
          ],
        ));
  }

  Widget _buildTabBarBody() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.w),
        child: const TabBarView(
          children: [
            WantedJobRequestsView(),
            AvailableJobsView(),

            // LoginView(),
            // RegisterView(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
