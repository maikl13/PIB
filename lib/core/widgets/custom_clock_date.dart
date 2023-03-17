import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../features/notification/presentation/widgets/clock_date.dart';
import '../resources/color_manager.dart';

class CustomClockDate extends StatelessWidget {
  const CustomClockDate({super.key, required this.date});
  final String date;

    _buildDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(DateTime.parse(date));
    return ClockDate(
      color: ColorManager.grey,
      date: formatted,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDate();
  }
}