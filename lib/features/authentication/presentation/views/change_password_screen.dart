import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/authentication/presentation/view_model_manger/reset_password/reset_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String emailAddress = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
        child: SingleChildScrollView(
          child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              ResetPasswordCubit cubit = ResetPasswordCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Lottie.asset(
                      AppImages.resetPasswordAnimation,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .38,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                            prefixIcon: Icons.lock,
                            controller: cubit.passwordController,
                            labelText: AppLocalizations.of(context)
                                .translate('password'),
                            isPassword: true,
                            validator: (value) =>
                                ValidateCheck.validatePassword(value, context),
                          ),
                          CustomTextField(
                            prefixIcon: Icons.lock,
                            labelText: AppLocalizations.of(context)
                                .translate('confirm_password'),
                            isPassword: true,
                            controller: cubit.passwordConfirmationController,
                            validator: (value) =>
                                ValidateCheck.validateConfirmPassword(value,
                                    context, cubit.passwordController.text),
                          ),
                          (state is ResetPasswordLoadingState)
                              ? const CustomLoader()
                              : ElevatedButton(
                                  onPressed: () async {
                                    await cubit.register(context, emailAddress);
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate('change_password'),
                                    style:
                                        AppTextStyles.elevatedButtonTextStyle,
                                  )),
                          TextButton(
                              onPressed: () {
                                cubit.navigateToLoginScreen(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('cancel'),
                                style: AppTextStyles.textButtonTextStyle,
                              ))
                        ],
                      ),
                    ),
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
