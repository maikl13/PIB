import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class CustomNetworkCachedImage extends StatelessWidget {
  const CustomNetworkCachedImage(
      {super.key, required this.url, this.fit, this.filter});

  final String url;
  final BoxFit? fit;
  final ColorFilter? filter;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // color: ColorManager.amber,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.fill,
            colorFilter: filter,
          ),
        ),
      ),
      // ColorFilter.mode(
      //           Colors.black.withOpacity(.4), BlendMode.darken)
      placeholder: (context, url) => const LoadingIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
