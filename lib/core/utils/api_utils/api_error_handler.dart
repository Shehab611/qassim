import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/utils/api_utils/api_error_response.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';

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
                case 301:
                  if (error.response!.data['errors'] != null) {
                    ErrorResponse errorResponse =
                        ErrorResponse.fromJson(error.response!.data);
                    if (errorResponse.errors != null &&
                        errorResponse.errors!.isNotEmpty) {
                      errorDescription = errorResponse;
                    } else {
                      errorDescription =
                          "Failed to load data - status code: ${error.response!.statusCode}";
                    }
                  } else if (error.response!.data['message'] != null) {
                    errorDescription = error.response!.data['message'];
                  }

                case 404:
                case 500:
                case 503:
                case 429:
                  if (error.response!.data['errors'] != null) {
                    if (error.response!.data['errors'] is List) {
                      errorDescription = error.response!.data['errors'][0];
                    } else {
                      errorDescription = error.response!.data['errors'];
                    }
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
      if (errorResponse.contains('account not exist') ||
          errorResponse.contains('email not correct') ||
          errorResponse.contains('not found')) {
        showCustomSnackBar(
            AppLocalizations.of(context).translate(AppStrings.accountNotExit),
            context);
      } else if (errorResponse.contains('credintials not correct')) {
        showCustomSnackBar(
            AppLocalizations.of(context).translate(AppStrings.wrongCredentials),
            context);
      } else if (errorResponse.contains('email already exists')) {
        showCustomSnackBar(
            AppLocalizations.of(context).translate(AppStrings.emailIsTaken),
            context);
      } else if (errorResponse.contains('your number not correct')) {
        showCustomSnackBar(
            AppLocalizations.of(context).translate(AppStrings.invalidOtp),
            context);
      } else if (errorResponse.contains('password not correct')) {
        showCustomSnackBar(
            AppLocalizations.of(context).translate(AppStrings.recentPasswordNotCorrect), context);
      } else if (errorResponse.contains('place already exists')) {
        showCustomSnackBar(AppLocalizations.of(context).translate(AppStrings.placeExist), context);
      }
    } else if (apiResponse.error is ErrorResponse) {
      Map<String, dynamic> errorResponse =
          apiResponse.error.errors as Map<String, dynamic>;
      if (errorResponse['email'] != null) {
        bool taken =
            errorResponse['email'][0].toString().contains('already been taken');
        if (taken) {
          showCustomSnackBar(
              AppLocalizations.of(context).translate(AppStrings.emailIsTaken),
              context);
        } else {
          if (kDebugMode) {
            print(errorResponse['email'][0]);
          }
        }
      }
    }
  }
}
