import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../search/presentation/widgets/search_result_item.dart';
import '../../data/models/ad_model.dart';

class FullTimeJobsView extends StatelessWidget {
  const FullTimeJobsView({super.key, required this.ads, this.typeHeadline});

  final List<Ads> ads;
  final String? typeHeadline;
  _buildBody() {
    return ListView.separated(
        padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SearchResultItem(
            companyName: ads[index].title,
            image: ads[index].image,
            jobTitle: ads[index].skillName,
            typeHeadline: typeHeadline,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12.h);
        },
        itemCount: ads.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        actions: const [],
        title: AppStrings.fullTimeJobs.replaceAll(':', ''),
      ),
      body: _buildBody(),
    );
  }
}
