import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'rating_bar.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants.dart';

class RatingStars extends StatefulWidget {
  const RatingStars(
      {super.key, required this.numberOfStars, required this.initailRate});
  final int numberOfStars;
  final double initailRate;

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  _buildRatingBar() {
    return RatingBar(
      initialRating: widget.initailRate,
      itemSize: 20.sp,
      minRating: 1,
      updateOnDrag: true,
      unratedColor: ColorManager.white,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: widget.numberOfStars,
      // itemPadding: EdgeInsets.only(left: 9.w),
      ratingWidget: RatingWidget(
          full: Image.asset(ImageAssets.activeStar),
          half: Icon(
            Icons.star,
            color: ColorManager.amber,
            // size: 35.sp,
          ),
          empty: Image.asset(ImageAssets.star)),
      onRatingUpdate: (rating) {
        setState(() {
          rateNumber = rating;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRatingBar();
  }
}
