import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/menu_cubit.dart';
import '../../business_logic/menu_state.dart';
import '../../../pip/data/models/skills_model.dart';

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
      listener: (context, state) {
        state.whenOrNull(
          userSkillsError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
        );
      },
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
