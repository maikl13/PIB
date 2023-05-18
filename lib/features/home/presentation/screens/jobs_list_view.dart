import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../search/presentation/widgets/search_result_item.dart';
import '../../data/models/ad_model.dart';

class JobsListView extends StatefulWidget {
  @override
  _JobsListView createState() => _JobsListView();

  final List<Ads> ads;
  final String? typeHeadline;
  JobsListView({super.key, required this.ads, this.typeHeadline});

}


class _JobsListView extends State<JobsListView>{


 late ScrollController _controller;
  bool _shouldClampScrollPhysics = true;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }
 void _onScroll() {
   setState(() {
     _shouldClampScrollPhysics = _controller.offset <= 0;
   });
 }


  _buildBody() {

    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          return true;
        },
        child: ListView.separated(
            controller: _controller,
            physics: _shouldClampScrollPhysics ? ClampingScrollPhysics() : BouncingScrollPhysics(),

            padding: EdgeInsets.only(top: 23.h, left: 20.w, right: 20.w),
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchResultItem(
                companyName: widget.ads[index].title,
                image: widget.ads[index].image,
                jobTitle: widget.ads[index].skillName,
                typeHeadline: widget.typeHeadline,
                ad: widget.ads[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.h);
            },
            itemCount: widget.ads.length),

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        actions: const [],
        title: widget.typeHeadline,
      ),
      body: _buildBody(),
    );
  }
}
