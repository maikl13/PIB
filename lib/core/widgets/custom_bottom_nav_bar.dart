import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar(
      {super.key, required this.onTap, required this.selectedIndex});
  final void Function(int index)? onTap;
  final int selectedIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed, // This is all you need!

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: AppStrings.main,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppStrings.theSearch,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            label: AppStrings.notification,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            label: AppStrings.manageDeals,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: AppStrings.menu,
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: widget.onTap!,
      ),
    );
  }
}
