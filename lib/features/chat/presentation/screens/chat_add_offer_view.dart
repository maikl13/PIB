import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../pip/presentation/widgets/request_custom_tetfield.dart';
import '../../../requests/business_logic/cubit/requests_cubit.dart';
import '../../business_logic/chat_cubit.dart';

class ChatAddOfferViewRoute extends StatefulWidget {
  const ChatAddOfferViewRoute({super.key, required this.chatId, required this.requestId});

  final int chatId;
  final int requestId;

  @override
  State<ChatAddOfferViewRoute> createState() => _ChatAddOfferViewRouteState();
}

class _ChatAddOfferViewRouteState extends State<ChatAddOfferViewRoute> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _jobTitleController=
      TextEditingController();
  final TextEditingController _timeToCompleteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding:
            EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h, bottom: 35.h),
        children: [
          const CustomTitle(title: 'اضافة عرض على وظيفتك :'),
          SizedBox(height: 20.h),
          _buildJobNameTextField(),
          SizedBox(height: 20.h),
          _buildPriceTextField(),
          SizedBox(height: 20.h),
          _buildTimeToCompleteTextField(),
          SizedBox(height: 320.h),
          _buildButton(context),
        ],
      ),
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.send,
      onTap: () {
  if (_formKey.currentState!.validate()) {
          BlocProvider.of<RequestsCubit>(context).giveOffer(
            price: _priceController.text,
            duration: _timeToCompleteController.text,
            description: '',
            requestId: widget.requestId.toString(),
          );
        } else {
          return Commons.showToast(message: 'من فضلك ادخل البيانات بشكل صحيح');
        }
        
        // showSuccessAddOfferInChatDialog(
        //   context,
        //   onOk: () {
        //     Navigator.pop(context);
        //   },
        // );
      },
    );
  }

  _buildPriceTextField() {
    return  RequestCustomTextField(
         validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      controller: _priceController,
      hint: AppStrings.price,
      icon: ImageAssets.tags,
    );
  }

  _buildJobNameTextField() {
    return  RequestCustomTextField(
       controller: _jobTitleController,
       validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      hint: AppStrings.jobName,
      icon: ImageAssets.fontSize,
    );
  }

  _buildTimeToCompleteTextField() {
    return RequestCustomTextField(
        validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل القيمة';
        }
        return null;
      },
      controller: _timeToCompleteController,
      suffix: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 10.h),
        child: Text(AppStrings.days,
            style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white)),
      ),
      hint: AppStrings.timeToComplete,
      icon: ImageAssets.clock,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          // BlocProvider.of<ChatCubit>(context).resumeStream();
          Navigator.pop(context);
        },
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.addOffer,
        actions: const [],
      ),
      body: _buildBody(context),
    );
  }
}
