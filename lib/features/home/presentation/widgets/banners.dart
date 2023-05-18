import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/cubit/home_cubit.dart';
import '../../business_logic/cubit/home_state.dart';
import '../../data/models/slider_model.dart';
import 'banner_item.dart';
import 'banner_item_loading.dart';


class Banners extends StatelessWidget {
  const Banners({super.key});

  _buildBloc(){
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is HomeSlidersSuccess,
      builder: (context, state) {
        return state.maybeWhen(homeSlidersLoading: () {
          return _buildView([] , true);
        }, homeSlidersSuccess: (sliders) {
          return _buildView(sliders , false);
        }, homeSlidersError: (networkExceptions) {
          return Text(networkExceptions.toString());
        }, orElse: () {
          return const SizedBox();
        });
      },
    );
  }
_buildView(List<SliderModel> sliders , bool loading){
    ScrollController controller =  ScrollController();

    int _currentIndex = 0;
    Timer.periodic(Duration(seconds: 6), (timer) {
      _currentIndex = (_currentIndex + 1) % sliders.length;


      double _position =  _currentIndex * (315.w + 2 *  15.w);

      controller.animateTo(_position, duration: Duration(seconds: 1), curve: Curves.ease);

    });
  return SizedBox(
      height: 180.h,
     
      child: ListView.separated(
        controller:controller ,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15.w,
            );
          },
          itemCount: loading ? 2: sliders.length,
          itemBuilder: (context, index) {
            return  loading  ? BannerItemLoading(): BannerItem(
            imageUrl: sliders[index].image,
            title: sliders[index].name,
              content: sliders[index].content,
            urlLink: sliders[index].link,
            );
          }),
    );
}
  @override
  Widget build(BuildContext context) {
        BlocProvider.of<HomeCubit>(context).getAllSliders();

    return _buildBloc();
  }
}
