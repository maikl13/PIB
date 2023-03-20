import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_title.dart';
import 'package:pip/features/chat/presentation/widgets/conversation_item.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/chat_cubit.dart';
import '../../business_logic/chat_state.dart';
import '../../data/models/hiring_chat_model.dart';

class ServiceRequesterMessagesView extends StatefulWidget {
  const ServiceRequesterMessagesView({super.key});

  @override
  State<ServiceRequesterMessagesView> createState() =>
      _ServiceRequesterMessagesViewState();
}

class _ServiceRequesterMessagesViewState
    extends State<ServiceRequesterMessagesView> {
  _buildBloc() {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is RequestsChatsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          hiringChatsLoading: () {
            return const LoadingIndicator();
          },
          hiringChatsSuccess: (requestsChats) {
            return _buildList(requestsChats);
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }

  _buildList(List<HiringChatModel> requestsChats) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: requestsChats.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.h);
      },
      itemBuilder: (context, index) {
        return ConversationItem(
          imageUrl: requestsChats[index].images!.isEmpty
              ? null
              : requestsChats[index].images![0].attachmentUrl,
          name: requestsChats[index].name,
          totalMessage: requestsChats[index].chatCount,
        );
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
        const CustomTitle(title: AppStrings.serviceRequesterMessagesTitle),
        SizedBox(height: 20.h),
        _buildBloc(),
      ],
    );
  }
}
