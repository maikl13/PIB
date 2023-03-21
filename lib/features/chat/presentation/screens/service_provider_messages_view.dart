import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/hiring_chat_model.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/chat_cubit.dart';
import '../../business_logic/chat_state.dart';
import '../widgets/conversation_item.dart';

class ServiceProviderMessagesView extends StatefulWidget {
  const ServiceProviderMessagesView({super.key});

  @override
  State<ServiceProviderMessagesView> createState() =>
      _ServiceProviderMessagesViewState();
}

class _ServiceProviderMessagesViewState
    extends State<ServiceProviderMessagesView> {
  _buildBloc() {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is HiringChatsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          hiringChatsLoading: () {
            return const LoadingIndicator();
          },
          hiringChatsSuccess: (hiringChats) {
            return _buildList(hiringChats);
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }

  _buildList(List<HiringChatModel> hiringChats) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: hiringChats.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.h);
      },
      itemBuilder: (context, index) {
        return ConversationItem(
          imageUrl: hiringChats[index].images!.isEmpty
              ? null
              : hiringChats[index].images![0].attachmentUrl,
          name: hiringChats[index].name,
          totalMessage: hiringChats[index].chatCount,
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
        const CustomTitle(title: AppStrings.serviceProviderMessagesTitle),
        SizedBox(height: 20.h),
        _buildBloc(),
      ],
    );
  }
}
