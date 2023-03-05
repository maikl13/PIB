import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(ImageAssets.splashLogo),
    );
  }
}
