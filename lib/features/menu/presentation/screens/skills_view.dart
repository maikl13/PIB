import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/custom_title.dart';

import '../widgets/skill_item.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  _buildBody() {
    return ListView(
      padding: EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w),
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        const CustomTitle(title: AppStrings.chooseSkills),
        SizedBox(height: 20.h),
        _buildSkills(),
      ],
    );
  }

  _buildSkills() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const SkillItem();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.skills,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
