import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool val = true;
  _buildSwitch() {
    return SizedBox(
      width: 37.w,
      height: 20.h,
      child: Transform.scale(
        scale: .7,
        transformHitTests: false,
        child: CupertinoSwitch(
          activeColor: val ? ColorManager.green : ColorManager.white,
          trackColor: val ? ColorManager.green : ColorManager.white5,
          value: val,
          onChanged: (value) {
            setState(() {
              val = value;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSwitch();
  }
}
