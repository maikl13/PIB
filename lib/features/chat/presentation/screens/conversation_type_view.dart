import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../business_logic/chat_cubit.dart';
import '../../business_logic/chat_state.dart';
import 'service_provider_messages_view.dart';
import 'service_requester_messages_view.dart';

import '../../../../core/resources/strings_manager.dart';

import '../../../requests/presentation/widgets/custom_tab_bar.dart';

class ConversationsTypeView extends StatelessWidget {
  const ConversationsTypeView({super.key});
  _buildBody() {
    return DefaultTabController(
        length: 2,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const CustomTabBar(
              title1: AppStrings.serviceRequesterMessages,
              title2: AppStrings.serviceProviderMessages,
            ),
            _buildTabBarBody(),
          ],
        ));
  }

  Widget _buildTabBarBody() {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.w),
            child: const TabBarView(
              children: [
                ServiceRequesterMessagesView(),
                ServiceProviderMessagesView(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
        BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();

    return _buildBody();
  }
}
