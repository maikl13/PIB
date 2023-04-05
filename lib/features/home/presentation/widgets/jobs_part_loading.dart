import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';
import '../../data/models/ad_model.dart';
import 'package:shimmer/shimmer.dart';
import 'show_all_text.dart';

import '../../../../core/widgets/custom_title.dart';

import 'job_item.dart';

class JobsPartLoading extends StatelessWidget {
  const JobsPartLoading({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return    Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white,
        child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child:  Container(
                width: 150,

                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Container(
              width: 50,

              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
            )
          ],
        ),
        SizedBox(height: 25.h),
        SizedBox(
          height: 122.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(width: 11.w);
            },
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  SizedBox(
                    width: 70.w,
                    height: 70.w,

                    child:   CircleAvatar(
                      radius: 50.r,
                      child: ClipOval(child: Container(color: Colors.white,)),
                    ),
                  ),



                  SizedBox(height: 7.h),
                  Container(
                    height: 12.h,
                    width: 50.w,
                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                ],
              );
            },
          ),
        ) ,
      ],
    ));
  }


}