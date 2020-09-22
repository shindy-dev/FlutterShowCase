import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  ImageViewer({Image image}) : _image = image;
  final Image _image;
  @override
  State<StatefulWidget> createState() => _ImageViewerState(image: _image);
}

class _ImageViewerState extends State<ImageViewer> {
  _ImageViewerState({Image image}) : _image = image;

  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InteractiveViewer(
        child: _image,
        minScale: 1.0,
        maxScale: 5.0,
      ),
    );
  }
}
