import 'package:flutter/material.dart';

class CustomSubHeadLine extends StatelessWidget {
  const CustomSubHeadLine({super.key, required this.title});
final String title ;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}