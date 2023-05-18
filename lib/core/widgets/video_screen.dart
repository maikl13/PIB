// import 'dart:developer';


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   static const routeName = "/VideoScreen";
//   RouteArgument argument;

//   VideoScreen({required this.argument});

//   @override
//   State<VideoScreen> createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   ChewieController? _chewieController;
//   late VideoPlayerController _videoPlayerController;
//   String url = 'https://pib-platform.com/uploads/1679503874_attachment.mp4';

//   // "https://www.fluttercampus.com/video.mp4";

//   @override
//   void initState() {

//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     initializePlayer(url);
//     // });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: WillPopScope(
//             onWillPop: _returnStatusBarToDefault,
//             child: Stack(children: [
//               _chewieController == null
//                   ? const Center(child: CircularProgressIndicator())
//                   : Chewie(controller: _chewieController!),
//               Positioned(
//                   top: MediaQuery.of(context).padding.top + 16,
//                   left: 16,
//                   right: 16,
//                   child:
//                       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                     InkWell(
//                         onTap: _returnStatusBarToDefault,
//                         child: Container(
//                             padding: EdgeInsets.all(10.w),
//                             decoration: BoxDecoration(
//                                 color: const Color(0x1a000000),
//                                 borderRadius: BorderRadius.circular(90),
//                                 border:
//                                     Border.all(color: const Color(0x26FFFFFF))),
//                             child: const Icon(Icons.arrow_forward,
//                                 color: Colors.white)))
//                   ]))
//             ])));
//   }

//   Future<void> initializePlayer(String url) async {
//     _videoPlayerController = VideoPlayerController.network(url);
//     await _videoPlayerController.initialize();
//     _createChewieController();
//     setState(() {});
//   }

//   void _createChewieController() {
//     _chewieController = ChewieController(
//         videoPlayerController: _videoPlayerController,
//         autoPlay: true,
//         showControlsOnInitialize: false,
//         materialProgressColors: ChewieProgressColors(playedColor: Colors.white),
//         looping: false,
//         showOptions: false);
//   }

//   Future<bool> _returnStatusBarToDefault() async {
//     BlocProvider.of<ChatCubit>(context).resumeChatStream();

//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.top]);
//     Navigator.pop(context);
//     return true;
//   }
// }