import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';
import '../../data/models/ad_model.dart';
import 'show_all_text.dart';

import '../../../../core/widgets/custom_title.dart';

import 'job_item.dart';

class JobsPart extends StatelessWidget {
  const JobsPart(
      {super.key,
      required this.headline,
      this.onShowAllTap,
      required this.ads});
  final String headline;
  final void Function()? onShowAllTap;
  final List<Ads> ads;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTitle(title: headline),
            ShowAllText(
              onTap: onShowAllTap,
            ),
          ],
        ),
        SizedBox(height: 25.h),
        SizedBox(
          height: 122.w,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 11.w,
                );
              },
              itemCount: ads.length,
              itemBuilder: (context, index) {
                return JobItem(
                  image: ads[index].image,
                  companyName: ads[index].title,
                  skillName: ads[index].skillName,
                  onTap: () {
        Navigator.pushNamed(context, Routes.jobDetailsViewRoute,
            arguments: {
              'ad': ads[index],
            });
      },
                );
              }),
        ),
      ],
    );
  }
}
