import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/profile/data/repositories/change_password_repo/change_password_repo_impl.dart';
import 'package:qassim/features/profile/presentation/view_model_manger/change_password_cubit/change_password_cubit.dart';
import 'package:qassim/service_locator.dart';

class ChangePasswordSheet extends StatelessWidget {
  const ChangePasswordSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context)
                .requestFocus(FocusNode());
          },
          child: BlocProvider(
            create: (context) => ChangePasswordCubit(
                sl<ChangePasswordRepoImpl>()),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              height: MediaQuery.of(context).viewInsets.bottom + 300,
              decoration: const BoxDecoration(
                  color: AppColors.darkerShadeColor1,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
              width: double.infinity,
              child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccessState) {
                    Navigator.pop(context);
                    showCustomSnackBar(
                        AppLocalizations.of(context)
                            .translate(AppStrings.passwordChangedSuccessful),
                        context,
                        isError: false,
                        inTop: true);
                  }
                },
                builder: (context, state) {
                  ChangePasswordCubit cubit = ChangePasswordCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.all(AppSizes.paddingSizeSmall),
                    child: SingleChildScrollView(
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: AppColors.darkerShadeColor6,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate(AppStrings.changePassword),
                              style: const TextStyle(
                                  color: AppColors.complementaryColor3,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              controller: cubit.recentPasswordController,
                              focusNode: cubit.recentPasswordNode,
                              nextFocus: cubit.newPasswordNode,
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              labelText: AppLocalizations.of(context)
                                  .translate(AppStrings.recentPassword),
                              validator: (value) =>
                                  ValidateCheck.validatePassword(value, context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              controller: cubit.passwordController,
                              focusNode: cubit.newPasswordNode,
                              prefixIcon: Icons.lock,
                              nextFocus: cubit.confirmPasswordNode,
                              isPassword: true,
                              labelText: AppLocalizations.of(context)
                                  .translate(AppStrings.newPassword),
                              validator: (value) =>
                                  ValidateCheck.validatePassword(value, context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              controller: cubit.passwordConfirmationController,
                              focusNode: cubit.confirmPasswordNode,
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              labelText: AppLocalizations.of(context)
                                  .translate(AppStrings.confirmNewPassword),
                              validator: (value) =>
                                  ValidateCheck.validateConfirmPassword(
                                      value, context, cubit.passwordController.text),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            (state is ChangePasswordLoadingState)
                                ? const CustomLoader()
                                : ElevatedButton(
                                onPressed: () {
                                  cubit.changePassword(context);
                                },
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate(AppStrings.changePassword),
                                  style: AppTextStyles.elevatedButtonTextStyle,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
