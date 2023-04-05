import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/empty_screen.dart';

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
