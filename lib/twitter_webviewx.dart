import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class TwitterWebViewx extends StatefulWidget {
  final String htmlCode;
  final double htmlHeight;

  const TwitterWebViewx({
    Key? key,
    required this.htmlCode,
    required this.htmlHeight,
  }) : super(key: key);

  @override
  _WebViewXPageState createState() => _WebViewXPageState();
}

class _WebViewXPageState extends State<TwitterWebViewx> {
  late WebViewXController webviewController;
  late WebViewX webviewx;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: _buildWebViewX(),
    );
  }

  void onWebViewCreated(controller) {
    print('onWebViewCreated called.');
    webviewController = controller;
  }

  void onPageStarted(src) {
    print('onPageStarted called.');
  }

  Widget _buildWebViewX() {
    Size windowSize = MediaQuery.of(context).size;
    print('@@@ 1: w ? ${windowSize.width}, h ? ${windowSize.height}');

    final htmlTemplate =
        "<html><body><div>${widget.htmlCode}</div></body></html>";

    webviewx = WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: htmlTemplate,
      initialSourceType: SourceType.html,
      width: windowSize.width,
      // height: windowSize.height + 50,
      height: widget.htmlHeight,
      onWebViewCreated: (controller) => onWebViewCreated(controller),
      onPageStarted: (src) => onPageStarted(src),
    );
    return Container(
      // decoration: const BoxDecoration(color: Colors.black),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      child: webviewx,
    );
  }
}
