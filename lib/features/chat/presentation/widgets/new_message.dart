import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/features/chat/business_logic/chat_state.dart';

import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../pip/presentation/widgets/upload_photos.dart';
import '../../business_logic/chat_cubit.dart';
import 'action_item.dart';
import 'dart:math' as math;

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/style_manager.dart';
// import 'dart:math' as math;

class NewMessage extends StatefulWidget {
  const NewMessage({
    Key? key,
    this.showAddOfferContainer,
    required this.chatId,
  }) : super(key: key);
  final bool? showAddOfferContainer;
  final int chatId;

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showActions = false;
  // ignore: prefer_final_fields
  String _enteredMessage = '';
//
  void _sendMessage() async {
    BlocProvider.of<ChatCubit>(context).sendMessage(
      widget.chatId.toString(),
      _enteredMessage,
    );
    // FocusScope.of(context).unfocus();
    messageController.clear();
  }

  Widget _buildAddOfferButton(context) {
    return DefaultButton(
      text: AppStrings.addOffer,
      widht: 148.w,
      onTap: () {
        BlocProvider.of<ChatCubit>(context).stopStream();

        Navigator.of(context)
            .restorablePushNamed(Routes.giveOffersViewRoute, arguments: {
          "chatId": widget.chatId,
          'requestId': currentRequestId,
        });
      },
    );
  }

  _buildSuffixIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform.rotate(
            angle: 45 * math.pi / 180,
            child: GestureDetector(
              onTap: () {
                _enteredMessage.isEmpty ? null : _sendMessage();
              },
              child: Icon(
                Icons.send,
                color: ColorManager.darkSeconadry,
                size: 20.sp,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showActions = !showActions;
              });
              // _sendMessage();
            },
            child: Image.asset(
              showActions ? ImageAssets.close : ImageAssets.add,
              width: 20.w,
              height: 20.h,
              color: ColorManager.darkSeconadry,
            ),
          ),
        ],
      ),
    );
  }

  _buildTextField() {
    final chatCubit = context.read<ChatCubit>();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return null;
              }
              return value;
            },
            onTap: () {
              if (messageController.selection ==
                  TextSelection.fromPosition(TextPosition(
                      offset: messageController.text.length - 1))) {
                setState(() {
                  messageController.selection = TextSelection.fromPosition(
                      TextPosition(offset: messageController.text.length));
                });
              }
            },
            style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 18.sp),
            cursorColor: ColorManager.darkSeconadry,
            controller: messageController,
            decoration: getdefaultTextFieldStyle(
              _buildSuffixIcon(),
              onTap: () async {
                chatCubit.stopStream();
                await chatCubit.pickImageFromCamera(widget.chatId);
                chatCubit.startStream(widget.chatId);
              },
            ),
            onChanged: (value) {
              setState(() {
                _enteredMessage = value;
                // print(_enteredMessage);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActionItem(
          icon: ImageAssets.camera,
          title: AppStrings.camera,
          onTap: () async {
            // chatCubit.stopStream();
            await chatCubit.pickImageFromCamera(widget.chatId);
            // chatCubit.startStream(widget.chatId);
          },
        ),
        ActionItem(
          icon: ImageAssets.picture,
          title: AppStrings.picturesAndVidoes,
          onTap: () async {
            // chatCubit.stopStream();
            // print("objectobjectobjectobjectobject");
            await chatCubit.getMultiMedia();
            // chatCubit.startStream(widget.chatId);
          },
        ),
        ActionItem(
          icon: ImageAssets.file,
          title: AppStrings.docs,
          onTap: () async {
            // chatCubit.stopStream();
            await chatCubit.getFile();
            // chatCubit.startStream(widget.chatId);
          },
        ),
        ActionItem(
          icon: ImageAssets.location,
          title: AppStrings.location,
          onTap: () {
            chatCubit.stopStream();
            Navigator.pushNamed(context, Routes.shareLocationViewRoute,
                arguments: {
                  "chatId": widget.chatId,
                });
            // print("objectobjectobjectobjectobject");
            // chatCubit.goToLocation();
          },
        ),
      ],
    );
  }

  _buildPhotos() {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        state.whenOrNull(
          sendMessageloading: () {
            Commons.showLoadingDialog(context);
          },
          sendMessageerror: (networkExceptions) {
            Navigator.of(context).pop();
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
          sendMessagesuccess: (data) {
            Navigator.of(context).pop();
            // Commons.showToast(message: "Message Sent Successfully");
          },
        );
      },
      buildWhen: (previous, next) =>
          next is ImageSelectedSuccess ||
          next is ImageSelectedDeleted ||
          next is SendMessageSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          imageSelectedSuccess: (images) {
            return _buildListPhotos(images);
          },
          imageSelectedDeleted: (images) {
            return _buildListPhotos(images);
          },
          orElse: () => Container(),
        );
      },
    );
  }

  _buildListPhotos(List<File> images) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        state.whenOrNull(
          imageSelectedDeleted: (images) {
            Commons.showToast(message: "Image Deleted Successfully");
            // print(images.length);
          },
        );
      },
      builder: (context, state) {
        return BlocProvider.of<ChatCubit>(context).imagesFile.isEmpty
            ? Container()
            : SizedBox(
                height: 130.h,
                child: ReorderableListView.builder(
                    onReorder: BlocProvider.of<ChatCubit>(context).onReorder,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return UploadedPhotos(
                        key: Key('$index'),
                        imageFile: images[index],
                        onTap: () {
                          BlocProvider.of<ChatCubit>(context)
                              .deleteImage(index);
                          setState(() {});
                        },
                      );
                    },
                    itemCount: images.length),
              );
      },

      // itemCount: images.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Visibility(
              visible: widget.showAddOfferContainer ?? false,
              child: _buildAddOfferButton(context)),
          SizedBox(height: 15.h),
          Container(
            // height: 93.h,
            decoration: BoxDecoration(color: ColorManager.lightBlack),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
              child: Column(
                children: [
                  _buildTextField(),
                  SizedBox(height: 20.h),
                  _buildPhotos(),
                  SizedBox(height: 20.h),
                  Visibility(
                      visible: showActions, child: _buildActions(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
