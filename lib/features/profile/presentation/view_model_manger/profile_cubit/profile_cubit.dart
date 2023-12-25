import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/features/profile/data/repositories/profile_data_repo/profile_data_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(const ProfileInitial());
  final ProfileRepo _profileRepo;

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    return super.close();
  }

  //#region Private Variables
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final int _userId =
      sl<SharedPreferences>().getInt(AppConstants.currentUserId)!;
  final IconData _editIcon = Icons.edit;
  final IconData _confirmIcon = Icons.check;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //#endregion

  //#region Getters
  TextEditingController get nameController => _nameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  GlobalKey<FormState> get formKey => _formKey;

  //#endregion

  //#region Public Variables

  IconData emailIcon = Icons.edit;
  bool emailButtonEditButtonVisible = true;
  bool emailFieldEnabled = false;
  IconData phoneIcon = Icons.edit;
  bool phoneButtonEditButtonVisible = true;
  bool phoneFieldEnabled = false;
  IconData nameIcon = Icons.edit;
  bool nameButtonEditButtonVisible = true;
  bool nameFieldEnabled = false;

  //#endregion

  //#region Private Methods
  Future<void> _updateUserDataLocal(Map<String, dynamic> updatedData) async {
    if (updatedData.keys.contains('email')) {
      await sl<Database>().rawUpdate('update users set email = ? where id = ?',
          [updatedData['email'], _userId]);
    } else if (updatedData.keys.contains('name')) {
      Future.microtask(() {
        sl<SharedPreferences>()
            .setString(AppConstants.currentUserName, updatedData['name']);
        sl<Database>().rawUpdate('update users set name = ? where id = ?',
            [updatedData['name'], _userId]);
      });
    } else {
      await sl<Database>().rawUpdate('update users set phone = ? where id = ?',
          [updatedData['phone'], _userId]);
    }
  }

  Future<void> _updateUserData(
      BuildContext context, Map<String, dynamic> updatedData) async {
    emit(const ProfileUpdateUserDataLoadingState());
    _changeEditButtonVisibility(updatedData, false);
    updatedData.putIfAbsent('id', () => _userId.toString());
    ApiResponse response = await _profileRepo.updateUserData(updatedData);
    if (response.response?.statusCode != null &&
        response.response?.statusCode == 201) {
      await _updateUserDataLocal(updatedData);
      _changeEditButtonVisibility(updatedData, true);
      emit(const ProfileUpdateUserDataSuccessfulState());
    } else {
      if (context.mounted) {
        _changeEditButtonVisibility(updatedData, true);
        ApiChecker.checkApi(response, context);
        emit(const ProfileUpdateUserDataFailedState());
      }
    }
  }

  void _updateUserEmail(BuildContext context) {
    Map<String, dynamic> data = {'email': _emailController.text};
    _updateUserData(context, data);
  }

  void _updateUserName(BuildContext context) {
    Map<String, dynamic> data = {'name': _nameController.text};
    _updateUserData(context, data);
  }

  void _updateUserPhone(BuildContext context) {
    Map<String, dynamic> data = {'phone': _phoneNumberController.text};
    _updateUserData(context, data);
  }

  void _changeEditButtonVisibility(
      Map<String, dynamic> updatedData, bool valueToUpdate) {
    if (updatedData.keys.contains('email')) {
      emailButtonEditButtonVisible = valueToUpdate;
    } else if (updatedData.keys.contains('phone')) {
      phoneButtonEditButtonVisible = valueToUpdate;
    } else {
      nameButtonEditButtonVisible = valueToUpdate;
    }
  }

  //#endregion

  //#region Public Methods
  Future<void> getUserData(BuildContext context) async {
    emit(const ProfileGetUserDataLoadingState());
    int userId = sl<SharedPreferences>().getInt(AppConstants.currentUserId)!;
    var data = await _profileRepo.getUserData(userId);
    if (data.success) {
      _nameController.text = data.user!.name;
      _emailController.text = data.user!.email;
      _phoneNumberController.text = data.user!.phone;
      emit(const ProfileGetUserDataSuccessfulState());
    } else {
      emit(ProfileGetUserDataFailedState(data.errorMessage!));
    }
  }

  void emailButtonPressed(BuildContext context) {
    if (emailIcon == _editIcon) {
      emailIcon = _confirmIcon;
      emailFieldEnabled = true;
      emit(const ProfileChangeEmailVariables());
    } else {
      emailIcon = _editIcon;
      emailFieldEnabled = false;
      emit(const ProfileChangeEmailVariables());
      _updateUserEmail(context);
    }
  }

  void phoneButtonPressed(BuildContext context) {
    if (phoneIcon == _editIcon) {
      phoneIcon = _confirmIcon;
      phoneFieldEnabled = true;
      emit(const ProfileChangePhoneVariables());
    } else {
      phoneIcon = _editIcon;
      phoneFieldEnabled = false;
      emit(const ProfileChangePhoneVariables());
      _updateUserPhone(context);
    }
  }

  void nameButtonPressed(BuildContext context) {
    if (nameIcon == _editIcon) {
      nameIcon = _confirmIcon;
      nameFieldEnabled = true;
      emit(const ProfileChangeNameVariables());
    } else {
      nameIcon = _editIcon;
      nameFieldEnabled = false;
      emit(const ProfileChangeNameVariables());
      _updateUserName(context);
    }
  }

//#endregion
}
