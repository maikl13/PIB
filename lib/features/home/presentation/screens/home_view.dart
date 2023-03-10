import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/features/home/presentation/widgets/banners.dart';
import 'package:pip/features/home/presentation/widgets/jobs_part.dart';
import 'package:pip/features/home/presentation/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  _buildHome() {
    return ListView(
      padding: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
      shrinkWrap: true,
      children: [
        _buildSearchBar(),
        SizedBox(height: 30.h),
        _buildBanners(),
        SizedBox(height: 41.h),
        _buildJobsRequestByCompanies(),
        SizedBox(height: 30.h),
        Divider(height: 1.h, color: ColorManager.grey),
        SizedBox(height: 35.h),
        _buildPartTimeJops(),
        SizedBox(height: 30.h),
        Divider(height: 1.h, color: ColorManager.grey),
        SizedBox(height: 35.h),
        _buildFullTimeJops(),
      ],
    );
  }

  _buildSearchBar() {
    return const SearchBar();
  }

  _buildBanners() {
    return const Banners();
  }

  _buildJobsRequestByCompanies() {
    return const JobsPart(
      headline: AppStrings.companiesRequireJobs,
    );
  }

  _buildPartTimeJops() {
    return const JobsPart(
      headline: AppStrings.partTimeJobs,
    );
  }

  _buildFullTimeJops() {
    return const JobsPart(
      headline: AppStrings.fullTimeJobs,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHome();
  }
}
