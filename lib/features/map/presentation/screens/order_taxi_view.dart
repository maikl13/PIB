import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/default_button.dart';
import 'package:pip/core/widgets/leading_arrow.dart';
import '../../../../core/resources/assets_manager.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late GoogleMapController mapController;
  LatLng latLng = const LatLng(21.4858, 39.1925);
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(21.4858, 39.1925), zoom: 14.4746);

  String? mapStyle = 'assets/map/google_map_style.json';

  final Set<Marker> _markers = {};

  late BitmapDescriptor pinIcon;

  Widget buildMap() {
    return Stack(
      children: [
        GoogleMap(
            // mapType: MapType.terrain,
            markers: _markers,
            initialCameraPosition: _kGooglePlex,
            zoomControlsEnabled: false,
            onMapCreated: mapCreated),
        _buildAppBar(),
        _buildFloatingContainer(),
      ],
    );
  }

  _buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(top: 63.h, right: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LeadingArrow(),
          SizedBox(width: 84.w),
          Text('طلب تاكسي',
              style:
                  getRegularStyle(fontSize: 20.sp, color: ColorManager.black))
        ],
      ),
    );
  }

  _buildFloatingContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
        child: Container(
          height: 219.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorManager.black5,
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
            child: Column(
              children: [
                _buildFloatingContainerHeader(),
                SizedBox(height: 17.h),
                Divider(
                    color: ColorManager.grey.withOpacity(.5), thickness: 1.sp),
                SizedBox(height: 20.h),
                _buildFloatingContainerBody(),
                SizedBox(height: 24.h),
                const DefaultButton(text: 'أكد موعد اللقاء مع السائق'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFloatingContainerHeader() {
    return Text('حدد نقطة الالتقاء',
        style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white));
  }

  _buildFloatingContainerBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'جدة - شارع قريش',
          style:
              getBoldStyle(fontSize: 15.sp, color: ColorManager.darkSeconadry),
        ),
        Container(
          width: 62.w,
          height: 31.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31.r),
              color: ColorManager.white.withOpacity(.2)),
          child: Center(
            child: Text(
              AppStrings.search,
              style: getBoldStyle(fontSize: 10.sp, color: ColorManager.white),
            ),
          ),
        ),
      ],
    );
  }

  void mapCreated(GoogleMapController controller) async {
    mapController = controller;
    _controller.complete(controller);
    pinIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0), ImageAssets.bell);
    // mapController.setMapStyle(Utils.mapStyles);
    showPinsOnMap();
  }

  Future<void> showPinsOnMap() async {
    setState(() {
      _markers.add(Marker(
          markerId: const MarkerId('clientPin'),
          position: latLng,
          icon: pinIcon,
          infoWindow: const InfoWindow(title: "Client"),
          onTap: () {}));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorManager.transparent,
        extendBody: true,
        // appBar: AppBar(),
        body: buildMap());
  }
}
