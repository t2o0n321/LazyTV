import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  // ex: {image: https://chinaq.img-ix.net/uploads/d/cn240608.jpg, url: https://chinaq.tv/xj/cn240608/}
  final Map<String, String> videoInfos;
  const DetailView(this.videoInfos, {super.key});

  @override
  Widget build(BuildContext context) {
    // This is a temporary solution to prevent the app from crashing
    if (videoInfos.length > 2) {
      Navigator.pop(context);
    }

    // print(videoInfos);
    return Container();
  }
}