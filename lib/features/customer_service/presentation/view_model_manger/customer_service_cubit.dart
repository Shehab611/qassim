import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/customer_service/data/models/customer_service_model.dart';
import 'package:qassim/features/customer_service/data/repositories/customer_service_repo.dart';

part 'customer_service_state.dart';

class CustomerServiceCubit extends Cubit<CustomerServiceState> {
  CustomerServiceCubit(this._customerServiceRepo)
      : super(const CustomerServiceInitial());
  final CustomerServiceRepo _customerServiceRepo;

  static CustomerServiceCubit get(BuildContext context) =>
      BlocProvider.of(context);

  @override
  Future<void> close() {
    _nameController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    return super.close();
  }

  //#region private variables
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  late final String _userEmail;

  //#endregion

  //#region getters
  TextEditingController get nameController => _nameController;

  TextEditingController get subjectController => _subjectController;

  TextEditingController get messageController => _messageController;

//#endregion
  //#region private methods
  void _clearControllers() {
    _messageController.clear();
    _subjectController.clear();
    _nameController.clear();
  }

  //#endregion
  //#region Public Methods
  Future<void> sendFeedBack(BuildContext context) async {
    emit(const CustomerServiceLoadingState());
    CustomerServiceRequestModel requestModel = CustomerServiceRequestModel(
        email: _userEmail,
        name: _nameController.text,
        subject: _subjectController.text,
        message: _messageController.text);
    ApiResponse apiResponse =
        await _customerServiceRepo.sendFeedBack(requestModel: requestModel);
    if (apiResponse.response?.statusCode != null &&
        apiResponse.response?.statusCode == 201) {
      _clearControllers();
      emit(const CustomerServiceSuccessState());
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const CustomerServiceFailedState());
      }
    }
  }

  Future<void> getUserData(BuildContext context) async {
    emit(const CustomerServiceUserDataLoadingState());
    var data = await _customerServiceRepo.getUserData();
    if (data.success) {
      _userEmail = data.user!.email;
      emit(const CustomerServiceUserDataSuccessState());
    } else {
      emit(CustomerServiceUserDataFailedState(data.errorMessage!));
    }
  }

  bool buttonEnabled() =>
      _nameController.text.isNotEmpty &&
      _subjectController.text.isNotEmpty &&
      _messageController.text.isNotEmpty;

//#endregion
}
