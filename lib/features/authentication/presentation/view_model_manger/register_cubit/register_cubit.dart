import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants.dart';
import 'package:qassim/features/authentication/data/models/register_model.dart';
import 'package:qassim/features/authentication/data/repositories/register/register_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(const RegisterInitial());
  final RegisterRepo registerRepo;

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  //#region private variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  //#endregion

  //#region getters
  TextEditingController get emailController => _emailController;

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get passwordConfirmationController =>
      _passwordConfirmationController;

  GlobalKey<FormState> get formKey => _formKey;

//#endregion

  //#region private methods
  void _navigateToHomeScreen(BuildContext context) {
    //AppNavigator.navigateToHomeScreen(context);
  }
  void _saveUserToken(String token){
    sl<SharedPreferences>().setString(AppConstants.userLoginTokenSharedPreferenceKey, token);
  }
  //#endregion

  //#region public methods
  Future<void> register(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      RegisterDataModel registerDataModel = RegisterDataModel(
          email: _emailController.text,
          name: _nameController.text,
          phone: _phoneController.text,
          password: _passwordController.text,
          passwordConfirmation: _passwordConfirmationController.text);
      ApiResponse apiResponse = await registerRepo.register(registerDataModel: registerDataModel);
      if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 200) {
        emit(RegisterSuccessfulState(apiResponse.response!.data));
      }else{

      }
    }
  }

  void onRegisterSuccess(BuildContext context,data){
    RegisterResponseModel responseModel = RegisterResponseModel.fromJson(data);
    _saveUserToken(responseModel.accessToken);
    _navigateToHomeScreen(context);
  }
//#endregion
}
