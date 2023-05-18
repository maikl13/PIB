import 'package:flutter/material.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/empty_screen.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.black5,
        title: AppStrings.termsAndCondition.trim(),
        actions: const [],
      ),
      body: const EmptyScreen(),
    );
  }
}
