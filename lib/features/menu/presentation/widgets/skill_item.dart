import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../business_logic/menu_cubit.dart';
import '../../../pip/presentation/widgets/custom_switch.dart';

import '../../../pip/data/models/skills_model.dart';

class SkillItem extends StatefulWidget {
  const SkillItem({
    super.key,
    required this.skills,
    required this.index,
  });

  final List<SkillModel> skills;
  final int index;

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  _buildIcon() {
    return SizedBox(
      width: 35.w,
      height: 35.h,
      child: CircleAvatar(
          radius: 25.r,
          backgroundColor: ColorManager.darkSeconadry,
          child: SizedBox(
              width: 15.w,
              height: 15.h,
              child: CustomNetworkCachedImage(
                  url: widget.skills[widget.index].imageUrl!))),
    );
  }

  _buildTitle() {
    return Text(
      widget.skills[widget.index].name ?? '',
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: val ? ColorManager.darkSeconadry : ColorManager.transparent),
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 20.h),
                _buildIcon(),
                SizedBox(height: 15.h),
                _buildTitle(),
              ],
            ),
            CustomSwitch(
              enabled: widget.skills[widget.index].enabled == 0 ? false : true,
              onChanged: (value) {
                if (value == true) {
                  BlocProvider.of<MenuCubit>(context)
                      .skills
                      .add(widget.skills[widget.index].id!);
                  BlocProvider.of<MenuCubit>(context).updateSkill();
                } else {
                  BlocProvider.of<MenuCubit>(context)
                      .skills
                      .remove(widget.skills[widget.index].id!);
                  BlocProvider.of<MenuCubit>(context).updateSkill();
                }
                setState(() {
                  value == true
                      ? widget.skills[widget.index].enabled = 1
                      : widget.skills[widget.index].enabled = 0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
