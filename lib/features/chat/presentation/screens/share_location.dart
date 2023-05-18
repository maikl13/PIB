import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/widgets/default_button.dart';
import 'package:pip/features/chat/business_logic/chat_cubit.dart';
import 'package:screenshot/screenshot.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import '../../../../core/resources/utils.dart';

class ShareLocation extends StatefulWidget {
  const ShareLocation({super.key, required this.chatId});
  final int chatId;
  @override
  State<ShareLocation> createState() => _ShareLocationState();
}

class _ShareLocationState extends State<ShareLocation> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late GoogleMapController mapController;
  LatLng firstLatLng = const LatLng(21.4858, 39.1925);
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(21.4858, 39.1925), zoom: 18.4746);
  final Set<Marker> _markers = {};
  late BitmapDescriptor pinIcon;
  String? address = '';

  MarkerId markerId = const MarkerId('My_Marker');
  ScreenshotController screenshotController = ScreenshotController();
  LatLng? tapLatLng;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: buildMap(),
        floatingActionButton: address == '' ? null : buildFloatAddress(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: buildBottomBar());
  }

  Widget buildFloatAddress() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 24.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.r),
                            color: Colors.black),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Text(address ?? '',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          height: 1.h,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)))
                            ])))
              ])
        ]);
  }

  Widget buildBottomBar() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
          child: DefaultButton(onTap: onItemTap, text: 'ارسال الموقع'))
    ]);
  }

  Widget buildMap() {
    return Stack(children: [
      GoogleMap(
          markers: _markers,
          initialCameraPosition: _kGooglePlex,
          onTap: setPinLocation,
          zoomControlsEnabled: false,
          onMapCreated: mapCreated),
      Positioned(
          right: 16.w,
          top: 16.h,
          child: InkWell(
              onTap: _getCurrentPosition,
              child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.r)),
                  child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Icon(Icons.my_location,
                          color: Theme.of(context).primaryColor)))))
    ]);
  }

  void mapCreated(GoogleMapController controller) async {
    mapController = controller;
    _controller.complete(controller);
    pinIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0), ImageAssets.pin);
    mapController.setMapStyle(mapStyles);
    showPinsOnMap();
  }

  Future<void> showPinsOnMap() async {
    setState(() {
      _markers.add(Marker(
          markerId: markerId,
          position: firstLatLng,
          icon: pinIcon,
          infoWindow: const InfoWindow(title: "عنوانك"),
          onTap: () {}));
    });
  }

  onItemTap() async {
    if (tapLatLng != null) {
      mapController
          .moveCamera(CameraUpdate.newLatLng(tapLatLng!))
          .whenComplete(() {
        mapController.takeSnapshot().then((value) {
          _share(value!);
          // ShowCapturedWidget(context, value!);
        });
      });
    } else {
      Commons.showToast(message: 'برجاء اختيار الموقع');
    }
  }

  Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(capturedImage);

    // resizedImg =

    // ignore: use_build_context_synchronously
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Captured widget screenshot"),
        ),
        body: Center(
            // ignore: unnecessary_null_comparison
            child: capturedImage != null ? Image.file(file) : Container()),
      ),
    );
  }

  Future<void> setPinLocation(LatLng argument) async {
    tapLatLng = argument;
    setState(() {
      _markers.add(Marker(
          markerId: markerId,
          position: argument,
          icon: pinIcon,
          infoWindow: const InfoWindow(title: "عنوانك"),
          onTap: () {}));
    });
    getAddressFromPos(argument);
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      getAddressFromPos(position);
      tapLatLng = LatLng(position.latitude, position.longitude);
      mapController.animateCamera(CameraUpdate.newLatLng(tapLatLng!));
      setState(() {
        _markers.add(Marker(
            markerId: markerId,
            icon: pinIcon,
            infoWindow: const InfoWindow(title: "عنوانك"),
            position: tapLatLng!));
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromPos(var position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude, localeIdentifier: "ar")
        .then((List<Placemark> placeMarks) {
      Placemark place = placeMarks[0];
      setState(() {
        String name = place.name!;
        String subLocality = place.subLocality!;
        String locality = place.locality!;
        String administrativeArea = place.administrativeArea!;
        address = "${name}, ${subLocality}, ${locality}, ${administrativeArea}";

      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Commons.showToast(message: "خدمة الموقع معطلة. الرجاء تمكين الخدمة");

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Commons.showToast(message: "Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Commons.showToast(message: "خدمة الموقع معطلة. الرجاء تمكين الخدمة");

      return false;
    }
    return true;
  }

  Future<void> _share(Uint8List capturedImage) async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(capturedImage);

    // XFile xFile = XFile(file.path);

    // ignore: use_build_context_synchronously
    BlocProvider.of<ChatCubit>(context).sendMessage(
      widget.chatId.toString(),
      'location_type_message,${tapLatLng!.latitude},${tapLatLng!.longitude}',
      attachment: file,
    );
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    BlocProvider.of<ChatCubit>(context).startStream(widget.chatId);
  }
}
