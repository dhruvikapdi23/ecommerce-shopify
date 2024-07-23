

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multikart/common/assets/index.dart';
import 'package:multikart/widgets/common/image_preview.dart';


Widget imageNetwork({
  required String url,
  double? height,
  double? width,
  BoxFit? fit,
  Widget? placeholder,
  String? errorImageAsset,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    width: width,
    height: height,
    fit: fit,
    placeholder: (context, url) =>
        placeholder ??
        const Center(
          child: SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
    errorWidget: (context, url, error) => Image.asset(
      errorImageAsset ?? imageAssets.noImageBanner,
      width: width,
      height: height,
      fit: BoxFit.cover,
    ),
  );
}

Future imagePreView(context, url) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    builder: (context) {
      return ImagePreview(url: url);
    },
  );
}
