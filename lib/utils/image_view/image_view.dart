import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';


class ImageView extends StatelessWidget {
  const ImageView(
      {super.key,
      required this.imageType,
      required this.imagePath,
      this.width,
      this.height});

  final ImageType imageType;
  final String imagePath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return imageType == ImageType.network
        ? Image.network(
            imagePath,
            width: width ?? 200.w,
            height: height ?? 300.h,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(imageData.noDataImage);
            },
          )
        : Image.asset(
            imagePath,
            width: width ?? 200.w,
            height: height ?? 300.h,
            fit: BoxFit.fill,
          );
  }
}

enum ImageType { asset, network }
