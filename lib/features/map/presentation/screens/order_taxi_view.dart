import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBody: true, body: buildMap());
  }

  Widget buildMap() {
    return GoogleMap(
        // mapType: MapType.terrain,
        markers: _markers,
        initialCameraPosition: _kGooglePlex,
        zoomControlsEnabled: false,
        onMapCreated: mapCreated);
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
}
