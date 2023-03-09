import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/features/home/presentation/widgets/show_all_text.dart';

import '../../../../core/widgets/custom_title.dart';

import 'job_item.dart';

class JobsPart extends StatelessWidget {
  const JobsPart({super.key, required this.headline});
  final String headline ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            CustomTitle(title:headline),
            const ShowAllText(),
          ],
        ),
        SizedBox(height: 25.h),
        SizedBox(
          height: 122.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 11.w,
                );
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                return  const JobItem();
              }),
        ),
      ],
    );
  }
}
