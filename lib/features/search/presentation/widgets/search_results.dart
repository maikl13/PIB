import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/features/home/data/models/ad_model.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_title.dart';
import 'search_result_item.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key, required this.ads});

  final List<Ads> ads;
  _buildResults() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SearchResultItem(
            companyName: ads[index].title,
            image: ads[index].image,
            jobTitle: ads[index].skillName,
            ad: ads[index],
            //TODO modify headline type
            typeHeadline: AppStrings.fullTimeJobs.replaceAll(':', ''),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12.h);
        },
        itemCount: ads.length);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 37.h, right: 20.w, left: 20.w),
      shrinkWrap: true,
      children: [
        const CustomTitle(title: AppStrings.searchResults),
        SizedBox(height: 20.h),
        _buildResults(),
      ],
    );
  }
}
