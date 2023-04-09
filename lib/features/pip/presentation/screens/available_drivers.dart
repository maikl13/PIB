import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/resources/constants.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/cubit/pip_cubit.dart';
import '../../business_logic/cubit/pip_state.dart';
import '../../../../core/resources/color_manager.dart';

import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/leading_arrow.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/loading_wwidget.dart';
import '../widgets/floating_drivers_container.dart';

class AvailableDriversView extends StatefulWidget {
  const AvailableDriversView(
      {super.key,
      required this.fastRequestAppBarTitle,
      required this.requestId});
  final String fastRequestAppBarTitle;
  final String requestId;
  @override
  State<AvailableDriversView> createState() => _AvailableDriversViewState();
}

class _AvailableDriversViewState extends State<AvailableDriversView>
    with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late GoogleMapController mapController;
  LatLng latLng =
      LatLng(double.parse(myLocationLat), double.parse(myLocationLng));
  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(myLocationLat), double.parse(myLocationLng)),
      zoom: 14.4746);
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  MarkerId user = const MarkerId('user');
  MarkerId taxi = const MarkerId('taxi');

  String googleAPIKey = apiKey;
  BitmapDescriptor userMarker = BitmapDescriptor.defaultMarker;

  // String? mapStyle = 'assets/map/google_map_style.json';

  final Set<Marker> _markers = {};

  late BitmapDescriptor pinIcon;

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

  setSourceAndDestinationIcons() async {
    userMarker = await getBitmapDescriptorFromAssetBytes(
        ImageAssets.marker, 80.sp.toInt());

    setState(() {});
  }

  Widget buildMap() {
    return Stack(
      children: [
        GoogleMap(
            mapType: MapType.terrain,
            // mapType: MapType.terrain,
            polylines: Set<Polyline>.of(polylines.values),
            markers: _markers,
            initialCameraPosition: _kGooglePlex,
            zoomControlsEnabled: false,
            onMapCreated: mapCreated),
        _buildAppBar(),
        _buildDriverInfo(),
      ],
    );
  }

  _buildDriverInfo() {
    return BlocConsumer<PipCubit, PipState>(
      listener: (context, state) {
        state.whenOrNull();
      },
      buildWhen: (previous, current) => current is DriverInfoUpdated,
      builder: (context, state) {
        return state.maybeWhen(
          driverInfoUpdated: (driverInfo) {
            return driverInfo.deliveryMan == null
                ? const SizedBox.shrink()
                : FloatingDriversContainer(
                    driverInfo: driverInfo,
                  );
          },
          orElse: () {
            return Padding(
              padding: EdgeInsets.only(right: 30.w, left: 30.w, bottom: 30.h),
              child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(child: LoadingWidget())),
            );
          },
        );
      },
    );
  }

  _buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(top: 63.h, right: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LeadingArrow(
            onTap: () {
              BlocProvider.of<PipCubit>(context).stopStream();
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 84.w),
          Text(widget.fastRequestAppBarTitle,
              style:
                  getRegularStyle(fontSize: 20.sp, color: ColorManager.black))
        ],
      ),
    );
  }

  void mapCreated(GoogleMapController controller) async {
    mapController = controller;
    _controller.complete(controller);
    // pinIcon = await BitmapDescriptor.fromAssetImage(
    //     const ImageConfiguration(devicePixelRatio: 2.0), ImageAssets.bell);
    // mapController.setMapStyle(Utils.mapStyles);
    showPinsOnMap();
    // setMapPins();
    makeLines();
  }

  void makeLines() async {
    await polylinePoints
        .getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(double.parse(myLocationLat),
          double.parse(myLocationLng)), //Starting LATLANG
      PointLatLng(double.parse(myDestinationLat),
          double.parse(myDestinationLng)), //End LATLANG
      travelMode: TravelMode.driving,
    )
        .then((value) {
      for (var point in value.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }).then((value) {
      addPolyLine();
    });
  }

  Future<void> showPinsOnMap() async {
    setState(() {
      _markers.add(Marker(
          markerId: taxi,
          position: LatLng(
              double.parse(myDestinationLat), double.parse(myDestinationLng)),
          icon: userMarker,
          // infoWindow: const InfoWindow(title: "Client"),
          onTap: () {}));
      _markers.add(Marker(
          markerId: user,
          position:
              LatLng(double.parse(myLocationLat), double.parse(myLocationLng)),
          icon: userMarker,
          // infoWindow: const InfoWindow(title: "Client"),
          onTap: () {}));
    });
  }

  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: const Color(0xffFCBD1E),
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    BlocProvider.of<PipCubit>(context)
        .startGetDriverInfoStream(widget.requestId);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await setSourceAndDestinationIcons();
      // showPinsOnMap();

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
        body: WillPopScope(
            onWillPop: () async {
              BlocProvider.of<PipCubit>(context).stopStream();

              Navigator.pop(context);
              return false;
            },
            child: buildMap()));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // BlocProvider.of<ChatCubit>(context).stopStream();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<PipCubit>(context).startGetDriverInfoStream(
          BlocProvider.of<PipCubit>(context).driverInfo!.id.toString());
    } else if (state == AppLifecycleState.inactive) {
      BlocProvider.of<PipCubit>(context)
          .stopStream(); // this is called when the app is in background
    } else if (state == AppLifecycleState.paused) {
      BlocProvider.of<PipCubit>(context)
          .stopStream(); // this is called when the app is in background
    } else if (state == AppLifecycleState.inactive) {
      BlocProvider.of<PipCubit>(context)
          .stopStream(); // this is called when the app is in background
    }
  }
}
