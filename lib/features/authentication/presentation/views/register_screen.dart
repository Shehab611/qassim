import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/authentication/presentation/view_model_manger/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessfulState) {
            RegisterCubit.get(context).navigateToLoginScreen(context);
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.blackLightLogo,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingSizeDefault),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextField(
                          controller: cubit.nameController,
                          prefixIcon: Icons.person,
                          labelText: AppLocalizations.of(context)
                              .translate(AppStrings.fullName),
                          validator: (value) => ValidateCheck.validateEmptyText(
                              value, context, 'full_name_required'),
                        ),
                        CustomTextField(
                          controller: cubit.emailController,
                          prefixIcon: Icons.alternate_email,
                          inputType: TextInputType.emailAddress,
                          labelText:
                              AppLocalizations.of(context).translate(AppStrings.email),
                          validator: (value) =>
                              ValidateCheck.validateEmail(value, context),
                        ),
                        CustomTextField(
                          controller: cubit.phoneController,
                          prefixIcon: Icons.call,
                          inputType: TextInputType.number,
                          labelText: AppLocalizations.of(context)
                              .translate(AppStrings.phoneNumber),
                          validator: (value) => ValidateCheck.validateEmptyText(
                              value, context, AppStrings.requiredPhoneNumber),
                        ),
                        CustomTextField(
                          controller: cubit.passwordController,
                          prefixIcon: Icons.lock,
                          labelText: AppLocalizations.of(context)
                              .translate(AppStrings.password),
                          isPassword: true,
                          validator: (value) =>
                              ValidateCheck.validatePassword(value, context),
                        ),
                        CustomTextField(
                          controller: cubit.passwordConfirmationController,
                          prefixIcon: Icons.lock,
                          labelText: AppLocalizations.of(context)
                              .translate(AppStrings.confirmPassword),
                          isPassword: true,
                          validator: (value) =>
                              ValidateCheck.validateConfirmPassword(value,
                                  context, cubit.passwordController.text),
                        ),
                        (state is RegisterLoadingState)
                            ? const CustomLoader()
                            : ElevatedButton(
                                onPressed: () {
                                  cubit.register(context);
                                },
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate(AppStrings.register),
                                  style: AppTextStyles.elevatedButtonTextStyle,
                                )),
                      ],
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                    text:
                        AppLocalizations.of(context).translate(AppStrings.haveAccount),
                    style: AppTextStyles.textButtonTextStyle,
                    children: [
                      TextSpan(
                          text: AppLocalizations.of(context).translate(AppStrings.login),
                          style: AppTextStyles.textButtonTextStyle
                              .copyWith(color: AppColors.complementaryColor2),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              cubit.navigateToLoginScreen(context);
                            })
                    ]),
              ),
            ],
          );
        },
      )),
    );
  }
}
