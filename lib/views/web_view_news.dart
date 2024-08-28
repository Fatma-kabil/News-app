import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNews extends StatefulWidget {
  const WebViewNews({Key? key, required this.newsurl}) : super(key: key);
  final String newsurl;

  @override
  State<WebViewNews> createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.newsurl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: _controller,
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
