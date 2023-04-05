import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/style_manager.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key, required this.phoneNumber});
  final String phoneNumber ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
            Commons.openUrl('tel:$phoneNumber');
            // Navigator.pushNamed(context, Routes.chatViewRoute,arguments: {
            //   'chatId'  : '1',
            // });
          },
          child: Container(
            width: 62.w,
            height: 27.w,
            decoration: BoxDecoration(
                color: ColorManager.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(31.r)),
            child: Center(
              child: Text('تواصل',
                  style: getBoldStyle(
                      fontSize: 10.sp, color: ColorManager.darkSeconadry)),
            ),
          ),
        );
  
  }
}