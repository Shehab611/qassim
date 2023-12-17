import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/utils/api_utils/api_error_response.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_localization.dart';

abstract final class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioExceptionType.connectionError:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 403:
                  debugPrint(
                      '<==Here is error body==${error.response!.data.toString()}===>');
                  if (error.response!.data['errors'] != null) {
                    errorDescription = error.response!.data['errors'][0];
                  } else {
                    errorDescription = error.response!.data['message'];
                  }
                  break;
                //case 301:
                case 404:
                case 500:
                case 503:
                case 429:
                  if (error.response!.data['errors'] != null) {
                    errorDescription = error.response!.data['errors'][0];
                  } else {
                    errorDescription = error.response!.data['message'];
                  }
                  break;
                default:
                  ErrorResponse errorResponse =
                      ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.errors != null &&
                      errorResponse.errors!.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription =
                        "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
            case DioExceptionType.badCertificate:
              errorDescription =
                  "Connection to API server failed due to Bad Certificate";
            case DioExceptionType.unknown:
              errorDescription =
                  "Connection to API server failed due to Unknown Error";
          }
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}

abstract final class ApiChecker {
  static void checkApi(ApiResponse apiResponse, BuildContext context) {
    if (apiResponse.error is String) {
      String errorResponse = apiResponse.error;
      if (errorResponse.contains('account not exist')) {
        showCustomSnackBar(
            AppLocalizations.of(context).translate('acc_not_exist'), context);
      }
      else if (errorResponse.contains('credintials not correct')) {
        showCustomSnackBar(
            AppLocalizations.of(context).translate('credentials_wrong'),
            context);
      }
    }
    else if (apiResponse.error is ErrorResponse) {
      Map<String, dynamic> errorResponse =
          apiResponse.error.errors as Map<String, dynamic>;
      if (errorResponse['email'] != null) {
        bool taken =
            errorResponse['email'][0].toString().contains('already been taken');
        if (taken) {
          showCustomSnackBar(
              AppLocalizations.of(context).translate('email_taken'), context);
        } else {
          print(errorResponse['email'][0]);
        }
      }
      else if(errorResponse['message'] != null){
        if(errorResponse['message'].toString().contains('email not correct')){
          showCustomSnackBar(
              AppLocalizations.of(context).translate('acc_not_exist'), context);
        }
      }
    }
  }
}
