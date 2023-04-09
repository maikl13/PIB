import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../business_logic/cubit/pip_cubit.dart';

import '../../../requests/business_logic/cubit/requests_cubit.dart';
import '../../../requests/business_logic/cubit/requests_state.dart';
import '../../../../core/resources/commons.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import '../../../../core/resources/assets_manager.dart';
import '../widgets/floating_confirm_destination.dart';
import '../widgets/order_taxi_appbar.dart';

class ConfirmDriverView extends StatefulWidget {
  const ConfirmDriverView({super.key, required this.fastRequestAppBarTitle});
  final String fastRequestAppBarTitle;

  @override
  State<ConfirmDriverView> createState() => _ConfirmDriverViewState();
}

class _ConfirmDriverViewState extends State<ConfirmDriverView> {
  // static Position? position;
  LatLng? tapLatLng;
  LatLng firstLatLng = const LatLng(21.4858, 39.1925);

  String? address = '';
  final Set<Marker> _markers = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late GoogleMapController mapController;

  LatLng latLng = const LatLng(21.4858, 39.1925);

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(21.4858, 39.1925), zoom: 14.4746);

  // String? mapStyle = 'assets/map/google_map_style.json';

  // final Set<Marker> _markers = {};
  MarkerId markerId = const MarkerId('My_Marker');

  // late BitmapDescriptor pinIcon;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }

  addCustmIcon() async {
    markerIcon = await getBitmapDescriptorFromAssetBytes(
        ImageAssets.marker, 80.sp.toInt());
    setState(() {});
  }

  _buildBloc() {
    return BlocListener<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          createFastRequestLoading: () {
            Commons.showLoadingDialog(context);
          },
          createFastRequestError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
                message: NetworkExceptions.getErrorMessage(networkExceptions));
          },
          createFastRequestSuccess: (data) {

            // BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();



            Navigator.pop(context);
            Navigator.pushReplacementNamed(
                context, Routes.availableDriversViewRoute,arguments: {
                  'title' : widget.fastRequestAppBarTitle,
              'requestId' : data.requestId.toString()
                });
          },
        );
      },
      child: Container(),
    );
  }

  Widget _buildView() {
    return Stack(
      children: [
        _buildMap(),
        _buildBloc(),
        
         FastRequestAppBar(
          title: widget.fastRequestAppBarTitle,
       
         ),
        FloatingConfirmDestenation(
          headerTitle: 'حدد الوجهة',
          buttonTitle: 'أكد الوجهة',
          onTap: () {
            myDestinationLat = tapLatLng!.latitude.toString();
            myDestinationLng = tapLatLng!.longitude.toString();
            // print('$myDestinationLat $myDestinationLng');
            BlocProvider.of<RequestsCubit>(context).createFastRequest(
              mettingPointLat: myLocationLat,
              mettingPointLong: myLocationLng,
              destinationLat: myDestinationLat,
              destinationLong: myDestinationLng,
            );
          },
          address: address ?? ' ',
        ),
        _buildGoToMyLocationButton(),
      ],
    );
  }

  _buildMap() {
    return GoogleMap(
      // myLocationEnabled: true,
      mapType: MapType.terrain,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      onTap: setPinLocation,
      markers: _markers,
      initialCameraPosition: _kGooglePlex,
      zoomControlsEnabled: false,
      onMapCreated: mapCreated,
    );
  }

  _buildGoToMyLocationButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 269.h, right: 20.w),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: _getCurrentPosition,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90.r)),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Image.asset(ImageAssets.gps),
            ),
          ),
        ),
      ),
    );
  }

  onItemTap() async {
    if (tapLatLng != null) {
      mapController
          .moveCamera(CameraUpdate.newLatLng(tapLatLng!))
          .whenComplete(() {});
    } else {
      Commons.showToast(message: 'برجاء اختيار الموقع');
    }
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
            icon: markerIcon,
            infoWindow: const InfoWindow(title: "عنوانك"),
            position: tapLatLng!));
      });
    }).catchError((e) {
      debugPrint(e);
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

  void mapCreated(GoogleMapController controller) async {
    mapController = controller;
    _controller.complete(controller);

    // addCustmIcon();

    // mapController.setMapStyle(Utils.mapStyles);
    showPinsOnMap();
  }

  Future<void> showPinsOnMap() async {
    setState(() {
      _markers.add(Marker(
          markerId: markerId,
          position: firstLatLng,
          icon: markerIcon,
          infoWindow: const InfoWindow(title: "عنوانك"),
          onTap: () {}));
    });
  }

  Future<void> setPinLocation(LatLng argument) async {
    tapLatLng = argument;
    setState(() {
      _markers.add(Marker(
          markerId: markerId,
          position: argument,
          icon: markerIcon,
          infoWindow: const InfoWindow(title: 'عنوانك'),
          onTap: () {}));
    });
    getAddressFromPos(argument);
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

        BlocProvider.of<GlobalCubit>(context).onMapDestinationTapped(address!);
      });
      // print(address);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  @override
  void initState() {
    _getCurrentPosition();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      addCustmIcon();

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorManager.transparent,
        extendBody: true,
        // appBar: AppBar(),
        body: _buildView());
  }
}
