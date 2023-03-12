import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_title.dart';
import '../widgets/conversation_item.dart';

class ServiceProviderMessagesView extends StatelessWidget {
  const ServiceProviderMessagesView({super.key});
  _buildList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.h);
      },
      itemBuilder: (context, index) {
        return const ConversationItem();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const CustomTitle(title: AppStrings.serviceProviderMessagesTitle),
        SizedBox(height: 20.h),
        _buildList(),
      ],
    );
  }
}
