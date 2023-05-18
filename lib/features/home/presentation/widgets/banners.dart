import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/cubit/home_cubit.dart';
import '../../business_logic/cubit/home_state.dart';
import '../../data/models/slider_model.dart';
import 'banner_item.dart';


class Banners extends StatelessWidget {
  const Banners({super.key});

  _buildBloc(){
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is HomeSlidersSuccess,
      builder: (context, state) {
        return state.maybeWhen(homeSlidersLoading: () {
          return const LoadingIndicator();
        }, homeSlidersSuccess: (sliders) {
          return _buildView(sliders);
        }, homeSlidersError: (networkExceptions) {
          return Text(networkExceptions.toString());
        }, orElse: () {
          return const SizedBox();
        });
      },
    );
  }
_buildView(List<SliderModel> sliders){
  return SizedBox(
      height: 180.h,
     
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15.w,
            );
          },
          itemCount: sliders.length,
          itemBuilder: (context, index) {
            return  BannerItem(
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
