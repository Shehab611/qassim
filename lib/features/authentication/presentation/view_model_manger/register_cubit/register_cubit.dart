import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';
import 'package:qassim/features/authentication/data/models/register_model.dart';
import 'package:qassim/features/authentication/data/repositories/register/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(const RegisterInitial());
  final RegisterRepo _registerRepo;

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    return super.close();
  }
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

  //#region public methods
  Future<void> register(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      emit(const RegisterLoadingState());
      RegisterDataModel registerDataModel = RegisterDataModel(
          email: _emailController.text,
          name: _nameController.text,
          phone: _phoneController.text,
          password: _passwordController.text.trim(),
          passwordConfirmation: _passwordConfirmationController.text.trim());

      ApiResponse apiResponse =
          await _registerRepo.register(registerDataModel: registerDataModel);
      if (apiResponse.response?.statusCode != null &&
          apiResponse.response?.statusCode == 201) {
        emit(const RegisterSuccessfulState());
      } else {
        if (context.mounted) {
          ApiChecker.checkApi(apiResponse, context);
          emit(const RegisterFailedState());
        }
      }
    }
  }

  void navigateToLoginScreen(BuildContext context) {
    AppNavigator.navigateToLoginScreen(context);
  }
//#endregion
}
