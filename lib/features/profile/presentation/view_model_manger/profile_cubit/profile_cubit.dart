import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/features/profile/data/repositories/profile_data_repo/profile_data_repo.dart';

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

  //#endregion

  //#region Getters
  TextEditingController get nameController => _nameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get phoneNumberController => _phoneNumberController;

//#endregion

  //#region Public Methods
  Future<void> getUserData(BuildContext context) async {
    emit(const ProfileGetUserDataLoadingState());
    var data = await _profileRepo.getUserData();
    if (data.success) {
      _nameController.text = data.user!.name;
      _emailController.text = data.user!.email;
      _phoneNumberController.text = data.user!.phone;
      emit(const ProfileGetUserDataSuccessfulState());
    } else {
      emit(ProfileGetUserDataFailedState(data.errorMessage!));
    }
  }
//#endregion
}
