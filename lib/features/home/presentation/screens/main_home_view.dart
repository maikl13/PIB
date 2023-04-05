import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/business_logic/global_state.dart';
import '../../../../core/resources/location_helper.dart';
import '../../../menu/business_logic/menu_cubit.dart';
import '../../../menu/business_logic/menu_state.dart';
import '../../../pip/business_logic/cubit/pip_cubit.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../requests/business_logic/cubit/requests_cubit.dart';
import '../../business_logic/cubit/home_cubit.dart';
import '../../business_logic/cubit/home_state.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  _buildBloc() {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        state.whenOrNull(
          selectedIndexChanged: (index) {
            screenIndex = index;
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
        selectedIndex: screenIndex,
        onTap: (index) {
          setState(() {
            BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(index);
          });
          // BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();
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
    BlocProvider.of<GlobalCubit>(context).getAllMessagesCount();
    BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();
    BlocProvider.of<GlobalCubit>(context).startMessagesCountStream();
    BlocProvider.of<MenuCubit>(context).getUserInfo();
    BlocProvider.of<MenuCubit>(context).getAllSettings();
    BlocProvider.of<MenuCubit>(context).getAllRates();
    BlocProvider.of<MenuCubit>(context).getAllSettings();
    BlocProvider.of<RequestsCubit>(context).getAllMyRequests();
    BlocProvider.of<RequestsCubit>(context).getAllMyFastRequests();
    // Position position = LocationHelper.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }
}
