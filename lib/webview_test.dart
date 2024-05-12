// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skori/core/dio_helper/dio_helper.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/widgets/snack_bar.dart';
import 'package:skori/modules/profile/presentation/screens/packages.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'core/theme/color_app.dart';
import 'modules/profile/presentation/bloc/packages/subscribe_bloc.dart';

class WebViewExample extends StatefulWidget {
  final String url;

  const WebViewExample({super.key, required this.url});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) async {
            debugPrint('Page started loading: $url');
             _controller.removeJavaScriptChannel("Toaster");
           // Response response = await DioHelper.get(url).then((value) {
              // if (value.data['acquirer']['response']['message'] =="Approved") {
              // //  SubscribeCubit.of(context).subscribe(chargeId:value.data['id'] );
              //
              // } else {
              //   RouteManager.navigateAndPopUntilFirstPage(PackagesScreen());
              //   showSnackBar("payment fail try again");
              // }
           //   return value;
            //});

          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
             print("url============$url");
            // https://dev.skori.com/api/payment/tap/callback?tap_id=chg_TS05A3920231100Po250210221
            _controller.runJavaScriptReturningResult("")
                .then((value) => print("response ===== ${value.toString()}"));
            if(url.contains('status=success')){

              print("success");
              RouteManager.navigateAndPopUntilFirstPage(PackagesScreen());

            }else if(url.contains('status=fail')){
                showSnackBar("payment fail try again");

            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''Page resource error:
            code: ${error.errorCode}
            description: ${error.description}
            errorType: ${error.errorType}
            isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.url));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title:  Text('Payment'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.

      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}


