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

  //#region Public Variables
  String selectedValue = '0';

  //#endregion

  //#region Public Methods
  List<DropdownMenuItem<String>> dropdownItems(BuildContext context) => [
        DropdownMenuItem(
            value: '0', child: Text(AppLocalizations.of(context).translate(AppStrings.morningTime))),
        DropdownMenuItem(
            value: '1', child: Text(AppLocalizations.of(context).translate(AppStrings.eveningTime))),
      ];

  void changeSelectedValue(String? newValue) {
    selectedValue = newValue!;
    if (newValue == '0') {
      emit(const BookingDropDownValueChangedToMorningState());
    } else {
      emit(const BookingDropDownValueChangedToEveningState());
    }
  }

  Future<void> bookPlace(String placeId, BuildContext context) async {
    emit(const BookingLoadingState());
    String timeVisit = (selectedValue == '0') ? 'فترة صباحية' : 'فترة مسائية';
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
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
//#endregion
}
