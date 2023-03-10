import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
