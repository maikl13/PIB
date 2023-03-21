import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/leading_arrow.dart';
import '../../../home/presentation/widgets/image_with_stars.dart';
import '../../../../core/resources/assets_manager.dart';

class AvailableDriversView extends StatefulWidget {
  const AvailableDriversView({super.key});

  @override
  State<AvailableDriversView> createState() => _AvailableDriversViewState();
}

class _AvailableDriversViewState extends State<AvailableDriversView> {
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
          height: 206.h,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFloatingContainerHeader() {
    return Text('المشاوير المتاحة',
        style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white));
  }

  _buildFloatingContainerBody() {
    return Container(
      height: 89.h,
      decoration: BoxDecoration(
          color: ColorManager.white.withOpacity(.10),
          borderRadius: BorderRadius.circular(10.r)),
      child: Stack(
        children: [
          _buildLeadingImage(),
          Padding(
            padding: EdgeInsets.only(top: 27.h, right: 97.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserName(),
                SizedBox(height: 9.h),
                Row(
                  children: [
                    _buildLocationIcon(),
                    SizedBox(width: 8.w),
                    _buildDistance(),
                  ],
                )
              ],
            ),
          ),
          _buildButton(),
        ],
      ),
    );
  }

  _buildButton() {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 15.w),
      child: Align(
        alignment: Alignment.topLeft,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.chatViewRoute);
          },
          child: Container(
            width: 62.w,
            height: 27.w,
            decoration: BoxDecoration(
                color: ColorManager.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(31.r)),
            child: Center(
              child: Text('تواصل',
                  style: getBoldStyle(
                      fontSize: 10.sp, color: ColorManager.darkSeconadry)),
            ),
          ),
        ),
      ),
    );
  }

  _buildDistance() {
    return Text('يبعد ١٠ ددقائق عن مكان اللقاء',
        style: getRegularStyle(fontSize: 10.sp, color: ColorManager.grey));
  }

  _buildLocationIcon() {
    return Icon(Icons.location_on,
        color: ColorManager.darkSeconadry, size: 12.sp);
  }

  _buildUserName() {
    return Text(AppStrings.userName,
        style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white));
  }

  _buildLeadingImage() {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, right: 12.w),
      child: SizedBox(
          width: 75.w,
          height: 65.w,
          child: ImageWithRating(
            height: 27.h,
          )),
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
