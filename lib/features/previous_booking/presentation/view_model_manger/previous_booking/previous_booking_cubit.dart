import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/features/previous_booking/data/model/previous_booking_model.dart';
import 'package:qassim/features/previous_booking/data/repositories/previous_booking_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'previous_booking_state.dart';

class PreviousBookingCubit extends Cubit<PreviousBookingState> {
  PreviousBookingCubit(this._bookingRepo) : super(const PreviousBookingInitial());

  //#region Private Variables
  final PreviousBookingRepo _bookingRepo;
  final int _userId = sl<SharedPreferences>().getInt(AppConstants.currentUserId)!;

  //#endregion

  //#region Public Methods
  Future<void> getPreviousBooking(BuildContext context) async {
    emit(const PreviousBookingGetDataLoadingState());
    ApiResponse apiResponse = await _bookingRepo.getPreviousBooking(_userId.toString());
    if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 200) {
      emit(PreviousBookingGetDataSuccessState(PreviousBookingModel.fromJson(apiResponse.response!.data)));
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const PreviousBookingGetDataFailedState());
      }
    }
  }
//#endregion
}
