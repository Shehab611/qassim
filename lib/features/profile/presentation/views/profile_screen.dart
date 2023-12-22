import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
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
            },
            builder: (context, state) {
              ProfileCubit cubit =ProfileCubit.get(context);
              return Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWithIconButton(
                      controller:cubit.emailController,
                      enabled: false,
                      icon: Icons.alternate_email,
                      labelText: AppLocalizations.of(context)
                          .translate(AppStrings.email),
                    ),
                    TextFieldWithIconButton(
                      controller: cubit.nameController,
                      enabled: false,
                      icon: Icons.person,
                      labelText: AppLocalizations.of(context)
                          .translate(AppStrings.fullName),
                    ),
                    TextFieldWithIconButton(
                      controller: cubit.phoneNumberController,
                      enabled: false,
                      icon: Icons.call,
                      labelText: AppLocalizations.of(context)
                          .translate(AppStrings.phoneNumber),
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
