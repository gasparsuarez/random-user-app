import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageAdapter extends StatelessWidget {
  final String url;
  const CachedImageAdapter({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, progress) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.teal,
            value: progress.progress,
          ),
        );
      },
    );
  }
}
