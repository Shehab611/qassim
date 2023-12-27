import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/map/presentation/view_model_manger/map_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static final Completer<WebViewController> _controller = Completer<WebViewController>();
  static WebViewController? controllerGlobal;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    return WillPopScope(
      onWillPop: _exitApp,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate(AppStrings.map)),
        ),
        drawer: const AppDrawer(),
        body: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            if (state is MapSuccessState) {
              return WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: state.url,
                gestureNavigationEnabled: true,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.future.then((value) => controllerGlobal = value);
                  _controller.complete(webViewController);
                },
                onPageStarted: (String url) {
                  if (kDebugMode) {
                    print('Page started loading: $url');
                  }
                },
                onPageFinished: (String url) {
                  if (kDebugMode) {
                    print('Page finished loading: $url');
                  }
                },
              );
            } else if (state is MapLoadingState) {
              return const CustomLoader();
            }
            return const NoDataScreen();
          },
        ),
      ),
    );
  }

  Future<bool> _exitApp() async {
    if (controllerGlobal != null) {
      if (await controllerGlobal!.canGoBack()) {
        controllerGlobal!.goBack();
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    } else {
      return Future.value(true);
    }
  }
}
