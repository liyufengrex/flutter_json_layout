import 'original_ui.dart' if (dart.library.html) 'real_ui.dart' as ui;
import 'original_element.dart' if (dart.library.html) 'dart:html' as element;
import 'package:flutter/material.dart';

/// web 上加载图片的控件
class WebImageWidget extends StatelessWidget {
  final String url;
  final double width, height;

  const WebImageWidget({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory(
      url,
      (int _) => element.ImageElement()..src = url,
    );
    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView(
        viewType: url,
      ),
    );
  }
}
