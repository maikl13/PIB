import 'package:pip/core/resources/route_manager.dart';
import 'package:pip/core/widgets/default_button.dart';
import 'package:pip/features/chat/presentation/widgets/action_item.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/style_manager.dart';
// import 'dart:math' as math;

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController messageController = TextEditingController();
  bool showActions = false;
  // String _enteredMessage = '';
//
  // void _sendMessage() async {
  //   // print(_enteredMessage);
  //   // BlocProvider.of<ChatCubxit>(context).sendMessage(_enteredMessage);
  //   FocusScope.of(context).unfocus();
  //   messageController.clear();
  // }

  _buildAddOfferButton(context) {
    return DefaultButton(
      text: AppStrings.addOffer,
      widht: 148.w,
      onTap: () {
        Navigator.of(context).pushNamed(Routes.chatAddOfferViewRoute);
        //
      },
    );
  }

  _buildSuffixIcon() {
    return GestureDetector(
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
                // _enteredMessage = value;
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
      children: const [
        ActionItem(
          icon: Icons.camera_alt,
          title: AppStrings.camera,
        ),
        ActionItem(
          icon: Icons.image,
          title: AppStrings.picturesAndVidoes,
        ),
        ActionItem(
          icon: Icons.edit_document,
          title: AppStrings.docs,
        ),
        ActionItem(
          icon: Icons.location_on,
          title: AppStrings.location,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAddOfferButton(context),
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
