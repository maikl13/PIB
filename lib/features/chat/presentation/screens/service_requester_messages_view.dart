import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/empty_screen.dart';
import '../widgets/conversation_item.dart';

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
      listener: (context, state) {
        state.whenOrNull(
          hiringChatsError: (error) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(error),
            );
          },
        );
      },
      buildWhen: (previous, next) => next is RequestsChatsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          requestsChatsLoading: () {
            return const LoadingIndicator();
          },
          requestsChatsSuccess: (requestsChats) {
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
    return requestsChats.isEmpty
        ? const EmptyScreen()
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: requestsChats.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
            itemBuilder: (context, index) {
              return ConversationItem(
                chatId: requestsChats[index].id!,
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
  void initState() {
    super.initState();
    BlocProvider.of<ChatCubit>(context).getAllRequestsChats();
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
