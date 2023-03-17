import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/custom_title.dart';
import 'package:pip/core/widgets/loading_indicator.dart';
import 'package:pip/features/menu/business_logic/menu_cubit.dart';
import 'package:pip/features/menu/business_logic/menu_state.dart';
import 'package:pip/features/pip/data/models/skills_model.dart';

import '../widgets/skill_item.dart';

class SkillsView extends StatefulWidget {
  const SkillsView({super.key});

  @override
  State<SkillsView> createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> {
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
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is UserSkillsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            userSkillsLoading: () {
              return const LoadingIndicator();
            },
            userSkillsSuccess: (skills) {
              return _buildList(skills);
            },
            orElse: () => Container());
      },
    );
  }

  _buildList(List<SkillModel> skills) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SkillItem(
            skills: skills,
            index: index,
            // title: skills[index].name!,
            // image:  skills[index].imageUrl!,
            // enabled: skills[index].enabled ==1 ? true : false,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.h);
        },
        itemCount: skills.length);
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MenuCubit>(context).getAllUserSkills();
  }

  @override
  void deactivate() {
    BlocProvider.of<MenuCubit>(context).skills.clear();
    super.deactivate();
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
