import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../business_logic/cubit/home_cubit.dart';
import '../../business_logic/cubit/home_state.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  _buildBloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          selectedIndexChanged: (index) {
            selectedTab = index;
          },
        );
      },
      builder: (context, state) {
        return _buildScaffold(context);
      },
    );
  }

  _buildScaffold(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedTab,
        onTap: (index) {
          BlocProvider.of<HomeCubit>(context).changeSelectedIndex(index);
        },
      ),
      appBar: defaultAppBar(context),
      body: _buildMainHomeViewBody(context),
    );
  }

  _buildMainHomeViewBody(context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RouteGenerator.screens[screenIndex];
      },
    );
  }

  @override
  void initState() {
    super.initState();

    // BlocProvider.of<HomeCubit>(context).getAllSliders();
    // BlocProvider.of<HomeCubit>(context).getInternationalTopDeals();
    // BlocProvider.of<HomeCubit>(context).getLocalTopDeals();

    // BlocProvider.of<MessagesCubit>(context).getAllMessages();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }
}
