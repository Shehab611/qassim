import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';


class NetworkInfo {
  final Connectivity? connectivity;
  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    ConnectivityResult result = await connectivity!.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  static void checkConnectivity(BuildContext context) {
    bool firstTime = true;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if(!firstTime) {
        //bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
        bool isNotConnected;
        if(result == ConnectivityResult.none) {
          isNotConnected = true;
        }else {
          isNotConnected = !await (_updateConnectivityStatus() as FutureOr<bool>);
        }
        if(context.mounted) {
          isNotConnected
              ? const SizedBox()
              : ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: isNotConnected ? Colors.red : Colors.green,
            duration: Duration(seconds: isNotConnected ? 6000 : 3),
            content: Text(
              isNotConnected
                  ? AppLocalizations.of(context).translate('no_connection')
                  : AppLocalizations.of(context).translate('connected'),
              textAlign: TextAlign.center,
            ),
          ));
        }
      }
      firstTime = false;
    });
  }

  static Future<bool?> _updateConnectivityStatus() async {
    bool? isConnected;
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    }catch(e) {
      isConnected = false;
    }
    return isConnected;
  }
}
