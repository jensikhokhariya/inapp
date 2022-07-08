import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Webpage_S extends StatefulWidget {
  const Webpage_S({Key? key}) : super(key: key);

  @override
  State<Webpage_S> createState() => _Webpage_SState();
}

class _Webpage_SState extends State<Webpage_S> {
  TextEditingController texturl = TextEditingController();
  String url = "https://www.google.com/";
  InAppWebViewController? inAppWebViewController;
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ListTile(
              leading: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (inAppWebViewController != null) {
                          inAppWebViewController!.goBack();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (inAppWebViewController != null) {
                          inAppWebViewController!.reload();
                        }
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              title: TextField(
                controller: texturl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (inAppWebViewController != null) {
                          var data = texturl;
                          inAppWebViewController!.loadUrl(
                            urlRequest: URLRequest(
                              url: Uri.parse("https://$data"),
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (inAppWebViewController != null) {
                          inAppWebViewController!.goForward();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(url),
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
                ),
                onWebViewCreated: (controller){
                  setState((){
                    inAppWebViewController = controller;
                  });
                },
                onLoadStart: (controller,url){
                  setState((){
                    this.url=url.toString();
                    texturl.text=this.url;
                  });
                },
                onLoadStop: (controller,url){
                  setState((){
                    this.url=url.toString();
                    texturl.text=this.url;
                  });
                },
                onProgressChanged: (controller,ps){
                  setState((){
                    setState((){
                      progress=ps/100;
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
