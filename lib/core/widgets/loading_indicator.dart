import 'package:flutter/material.dart';
import '../resources/color_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: ColorManager.darkSeconadry,
    ));
  }
}
