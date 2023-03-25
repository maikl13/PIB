import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip/features/chat/business_logic/chat_state.dart';

import '../../../../core/resources/commons.dart';
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
  const NewMessage({Key? key, this.showAddOfferContainer, required this.chatId})
      : super(key: key);
  final bool? showAddOfferContainer;
  final int chatId;

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController messageController = TextEditingController();
  bool showActions = false;
  // ignore: prefer_final_fields
  String _enteredMessage = '';
//
  void _sendMessage() async {
    BlocProvider.of<ChatCubit>(context).sendMessage(
      widget.chatId.toString(),
      _enteredMessage,
    );
    FocusScope.of(context).unfocus();
    messageController.clear();
  }

  Widget _buildAddOfferButton(context) {
    return DefaultButton(
      text: AppStrings.addOffer,
      widht: 148.w,
      onTap: () {
        BlocProvider.of<ChatCubit>(context).stopStream();

        Navigator.of(context)
            .pushNamed(Routes.chatAddOfferViewRoute, arguments: {
          "chatId": widget.chatId,
        });
        //
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
                _sendMessage();
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
            child: Icon(
              showActions ? Icons.close : Icons.add,
              color: ColorManager.darkSeconadry,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  _buildTextField() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 18.sp),
            cursorColor: ColorManager.darkSeconadry,
            controller: messageController,
            decoration: getdefaultTextFieldStyle(_buildSuffixIcon()),
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

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActionItem(
          icon: Icons.camera_alt,
          title: AppStrings.camera,
          onTap: () {
            BlocProvider.of<ChatCubit>(context).stopStream();
            // print("objectobjectobjectobjectobject");
            BlocProvider.of<ChatCubit>(context).pickImageFromCamera();
          },
        ),
        ActionItem(
          icon: Icons.image,
          title: AppStrings.picturesAndVidoes,
          onTap: () {
            BlocProvider.of<ChatCubit>(context).stopStream();
            // print("objectobjectobjectobjectobject");
            BlocProvider.of<ChatCubit>(context).getMultiMedia();
          },
        ),
        ActionItem(
          icon: Icons.edit_document,
          title: AppStrings.docs,
          onTap: () {
            BlocProvider.of<ChatCubit>(context).stopStream();
            BlocProvider.of<ChatCubit>(context).getFile();
          },
        ),
        ActionItem(
          icon: Icons.location_on,
          title: AppStrings.location,
          onTap: () {
            BlocProvider.of<ChatCubit>(context).stopStream();
            Navigator.pushNamed(context, Routes.shareLocationViewRoute,
                arguments: {
                  "chatId": widget.chatId,
                });
            // print("objectobjectobjectobjectobject");
            // BlocProvider.of<ChatCubit>(context).goToLocation();
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
    return Column(
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
                Visibility(visible: showActions, child: _buildActions()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
