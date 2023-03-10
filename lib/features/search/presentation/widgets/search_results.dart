import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_title.dart';
import 'package:pip/features/search/presentation/widgets/search_result_item.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});
  _buildResults() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const SearchResultItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12.h);
        },
        itemCount: 10);
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
