import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/features/chat/business_logic/chat_state.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/chat_cubit.dart';
import '../../data/models/job_chats_model.dart';
import '../widgets/chats_item.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key, required this.jobChatsId});

  final int jobChatsId;

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  _buildBody() {
    return BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          state.whenOrNull(
            jobChatsError: (error) {
                 Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(error),
            );
            },
          );
        },
        buildWhen: (previous, next) => next is JobChatsSuccess,
        builder: (context, state) {
          return state.maybeWhen(
            jobChatsLoading: () {
              return const LoadingIndicator();
            },
            jobChatsSuccess: (jobChats) {
              return _buildList(jobChats);
            },
            orElse: () {
              return Container();
            },
          );
        });
  }

  _buildList(JobChatsModel jobChats) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(title: AppStrings.chatsTitle),
            SizedBox(height: 20.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: jobChats.chats!.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.h);
              },
              itemBuilder: (context, index) {
                return ChatsItem(
                  jobChats: jobChats,
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatCubit>(context).getAllJobChats(widget.jobChatsId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.chatAppbar,
        appBarColor: ColorManager.lightBlack,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
