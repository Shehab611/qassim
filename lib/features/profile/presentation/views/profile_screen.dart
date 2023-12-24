import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/profile/presentation/components/edit_row.dart';
import 'package:qassim/features/profile/presentation/view_model_manger/logout_cubit/logout_cubit.dart';
import 'package:qassim/features/profile/presentation/view_model_manger/profile_cubit/profile_cubit.dart';
import 'package:qassim/features/profile/presentation/widgets/change_password_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).translate(AppStrings.profile),
        ),
        actions: [
          BlocBuilder<LogoutCubit, LogoutState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    LogoutCubit.get(context).logout(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                  ));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeEight),
        child: SizedBox(
          height: size.height * 0.6,
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileGetUserDataFailedState) {
                showCustomSnackBar(state.errorMessage, context);
              }
              if (state is ProfileUpdateUserDataSuccessfulState) {
                showCustomSnackBar(AppLocalizations.of(context).translate(AppStrings.dataUpdatedSuccess), context,
                    inTop: true, isError: false);
              }
            },
            builder: (context, state) {
              ProfileCubit cubit = ProfileCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWithIconButton(
                      controller: cubit.emailController,
                      icon: Icons.alternate_email,
                      labelText: AppLocalizations.of(context)
                          .translate(AppStrings.email),
                      buttonIcon: cubit.emailIcon,
                      validator: (value) =>
                          ValidateCheck.validateEmail(value, context),
                      enabled: cubit.emailFieldEnabled,
                      isButtonVisible: cubit.emailButtonEditButtonVisible,
                      onPressed: () {
                        cubit.emailButtonPressed(context);
                      },
                    ),
                    TextFieldWithIconButton(
                      controller: cubit.nameController,
                      icon: Icons.person,
                      labelText: AppLocalizations.of(context)
                          .translate(AppStrings.fullName),
                      enabled: cubit.nameFieldEnabled,
                      buttonIcon:cubit.nameIcon ,
                      isButtonVisible: cubit.nameButtonEditButtonVisible,
                      onPressed: () {
                        cubit.nameButtonPressed(context);
                      },
                    ),
                    TextFieldWithIconButton(
                      controller: cubit.phoneNumberController,
                      icon: Icons.call,
                      labelText: AppLocalizations.of(context)
                          .translate(AppStrings.phoneNumber),
                      enabled: cubit.phoneFieldEnabled,
                      isButtonVisible: cubit.phoneButtonEditButtonVisible,
                      buttonIcon:cubit.phoneIcon,
                      onPressed: () {
                        cubit.phoneButtonPressed(context);
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return const ChangePasswordSheet();
                            },
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)
                              .translate(AppStrings.changePassword),
                          style: AppTextStyles.elevatedButtonTextStyle,
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
