import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../../../../core/widgets/error_screen.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/cubit/notification_cubit.dart';
import '../../business_logic/cubit/notification_state.dart';
import '../../data/models/notification_model.dart';
import '../widgets/notification_item.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  _buildBloc() {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
          idle: () {
            return const LoadingIndicator();
          },
          success: (data) {
            return _buildNotificationViewBody(data);
          },
          error: (networkExceptions) {
            return ErrorScreen(
                message: NetworkExceptions.getErrorMessage(networkExceptions));
          },
          loading: () {
            return const LoadingIndicator();
          },
        );
      },
    );
  }

  Widget _buildNotificationViewBody(List<NotifiticationModel> notifications) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return NotificationItem(
              notificationContent: notifications[index].content!,
              isRead: notifications[index].isRead == 1,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 15.h);
          },
          itemCount: notifications.length),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationCubit>(context).getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        actions: const [],
        title: AppStrings.notification,
      ),
      body: _buildBloc(),
    );
  }
}
