import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../business_logic/cubit/requests_state.dart';
import '../../../../core/resources/strings_manager.dart';
import 'available_jobs_view.dart';
import 'wanted_job_requests_view.dart';

import '../widgets/custom_tab_bar.dart';

class MyRequestsMainView extends StatefulWidget {
  const MyRequestsMainView({super.key});

  @override
  State<MyRequestsMainView> createState() => _MyRequestsMainViewState();
}

class _MyRequestsMainViewState extends State<MyRequestsMainView> {
  _buildBody() {
    return DefaultTabController(
        length: 2,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const CustomTabBar(
              title1: AppStrings.specialSendedRequests,
              title2: AppStrings.recievedRequests,
            ),
            _buildTabBarBody(),
          ],
        ));
  }

  Widget _buildTabBarBody() {
    return BlocListener<RequestsCubit, RequestState>(
      listener: (context, state) {
      },
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.w),
          child: const TabBarView(
            children: [
              WantedJobRequestsView(),
              AvailableJobsView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
