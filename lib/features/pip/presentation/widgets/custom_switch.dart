import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';


class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, this.onChanged, this.enabled});
  final void Function(bool)? onChanged;
  final bool? enabled;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  _buildSwitch() {
    return SizedBox(
      width: 37.w,
      height: 20.h,
      child: Transform.scale(
        scale: .7,
        transformHitTests: false,
        child: CupertinoSwitch(
          
          activeColor:
              widget.enabled! ? ColorManager.toastSuccess : ColorManager.white,
          trackColor:
              widget.enabled! ? ColorManager.toastSuccess : ColorManager.white5,
          value: widget.enabled ?? false,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSwitch();
  }
}
