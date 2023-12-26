import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/home/data/repositories/booking/booking_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this._bookingRepo) : super(const BookingInitial());

  static BookingCubit get(BuildContext context) => BlocProvider.of(context);

  //#region Private Variables
  final BookingRepo _bookingRepo;
  final int _userId = sl<SharedPreferences>().getInt(AppConstants.currentUserId)!;

  //#endregion

  //#region Public Methods
  Future<void> bookPlace(String placeId, String timeVisit, BuildContext context) async {
    emit(const BookingLoadingState());
    ApiResponse apiResponse = await _bookingRepo.bookPlace(_userId.toString(), placeId, timeVisit);
    if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 201) {
      if (context.mounted) {
        showCustomSnackBar(AppLocalizations.of(context).translate(AppStrings.bookedSuccess), context,
            isError: false, inTop: true);
        emit(const BookingSuccessState());
      }
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
      }
      emit(const BookingFailedState());
    }
  }
//#endregion
}
