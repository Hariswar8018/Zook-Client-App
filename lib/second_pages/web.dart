import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatefulWidget {
  const Web({super.key,required this.name, required this.link});
  final String link, name;

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  late final WebViewController controller;

  double progress = 0.0;

  void initState(){
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progres) {
            setState(() {
              progress = progres / 100;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )..loadRequest(Uri.parse(widget.link));
  }
  DateTime? _lastPressedAt;
  int c = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffF6F6F6),
        title: Text(widget.name,style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (progress < 1.0)
            LinearProgressIndicator(
              value: progress,
              minHeight: 3,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}
