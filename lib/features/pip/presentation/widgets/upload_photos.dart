import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

import '../../../../core/resources/style_manager.dart';

class UploadedPhotos extends StatelessWidget {
  const UploadedPhotos({super.key, this.imageFile, this.onTap});

  final File? imageFile;
  final Function()? onTap;
  bool isPdfFile(File file) {
    String extension = path.extension(file.path);
    return extension.toLowerCase() == '.pdf';
  }

  bool isVideo(File file) {
    String extension = path.extension(file.path);
    if (extension.toLowerCase() == '.mp4' ||
        extension.toLowerCase() == '.mov' ||
        extension.toLowerCase() == '.avi' ||
        extension.toLowerCase() == '.flv' ||
        extension.toLowerCase() == '.wmv' ||
        extension.toLowerCase() == '.3gp' ||
        extension.toLowerCase() == '.mkv' ||
        extension.toLowerCase() == '.webm') {
      return true;
    } else {
      return false;
    }
  }

  _buildPhoto(BuildContext context) {
    return isPdfFile(imageFile!)
        ? Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 136.w,
              height: 85.h,
              decoration: BoxDecoration(
                // color: ColorManager.error,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.asset(
                ImageAssets.file,
                fit: BoxFit.cover,
              ),
            ),
          )
        : isVideo(imageFile!)
            ? Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 136.w,
                  height: 85.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.video_collection_rounded,
                    color: ColorManager.darkSeconadry,
                  ),
                ),
              )
            : Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 136.w,
                  height: 85.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          ColorManager.black.withOpacity(.3), BlendMode.darken),
                      image: FileImage(
                        imageFile!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
  }

  _buildDeleteImageButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            ImageAssets.close,
            width: 12.w,
            height: 12.h,
            fit: BoxFit.scaleDown,
            color: ColorManager.darkSeconadry,
          ),
        ),
      ),
    );
  }

  _buildStack(BuildContext context) {
    return SizedBox(
      width: 151.w,
      height: 95.h,
      // color: Colors.red,
      child: Stack(
        children: [
          _buildPhoto(context),
          _buildDeleteImageButton(),
        ],
      ),
    );
  }

  _buildImageTitle() {
    var formatted = imageFile!.path.split('-').last;
    formatted = formatted.split('/').last;
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Text(
        formatted,
        style: getRegularStyle(fontSize: 15.sp, color: ColorManager.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildStack(context),
        _buildImageTitle(),
      ],
    );
  }
}
