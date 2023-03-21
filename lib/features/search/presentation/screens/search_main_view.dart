import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/leading_arrow.dart';
import '../../../home/presentation/widgets/search_bar.dart';

import '../../../../core/resources/color_manager.dart';
import '../../business_logic/bloc/search_bloc.dart';
import '../../business_logic/bloc/search_event.dart';
import '../../business_logic/bloc/search_state.dart';
import '../widgets/empty_search_results.dart';
import '../widgets/search_results.dart';

class SearchMainView extends StatefulWidget {
  const SearchMainView({super.key});

  @override
  State<SearchMainView> createState() => _SearchMainViewState();
}

class _SearchMainViewState extends State<SearchMainView> {
  final _searchController = TextEditingController();
  // late SearchBloc _searchBloc;

  _buildBody() {
    return BlocBuilder<SearchBloc, SearchState>(
      // bloc: _searchBloc,
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(child: EmptySearchResults());
        } else if (state is SearchLoading) {
          return const LoadingIndicator();
        } else if (state is SearchLoaded) {
          return state.ads.isEmpty
              ? const Center(child: EmptySearchResults())
              : SearchResultsView(
                  ads: state.ads,
                );
        } else if (state is SearchEmpty) {
          return const Center(child: EmptySearchResults());
        } else if (state is SearchError) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        } else {
          return Container();
        }
      },
    );
  }

//const Center(child: EmptySearchResults());
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: ColorManager.lightBlack,
          leading: const LeadingArrow(),
          title: SearchBar(
            controller: _searchController,
            fillColor: ColorManager.darkBlack,
            onChanged: (text) => BlocProvider.of<SearchBloc>(context)
                .add(SearchTextChanged(text)),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }
}
