import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/leading_arrow.dart';
import '../../../home/presentation/widgets/search_bar.dart';

import '../../../../core/resources/color_manager.dart';
import '../widgets/search_results.dart';

class SearchMainView extends StatefulWidget {
  const SearchMainView({super.key});

  @override
  State<SearchMainView> createState() => _SearchMainViewState();
}

class _SearchMainViewState extends State<SearchMainView> {
  _buildBody() {
    return const SearchResultsView();
  }

  // _buildBody() {
  //   return const Center(child: EmptySearchResults());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: ColorManager.lightBlack,
          leading: const LeadingArrow(),
          title: SearchBar(
            fillColor: ColorManager.darkBlack,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }
}
