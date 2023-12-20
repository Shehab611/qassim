import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/authentication/presentation/view_model_manger/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessfulState) {
              LoginCubit.get(context).navigateToHomeScreen(context);
            }
          },
          builder: (context, state) {
            LoginCubit cubit = LoginCubit.get(context);
            return Form(
              key: cubit.formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AppImages.blackLightLogo,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingSizeDefault),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextField(
                              prefixIcon: Icons.alternate_email,
                              controller: cubit.emailController,
                              inputType: TextInputType.emailAddress,
                              labelText: AppLocalizations.of(context)
                                  .translate('email'),
                              validator: (value) =>
                                  ValidateCheck.validateEmail(value, context),
                            ),
                            CustomTextField(
                              controller: cubit.passwordController,
                              prefixIcon: Icons.lock,
                              labelText: AppLocalizations.of(context)
                                  .translate('password'),
                              isPassword: true,
                              validator: (value) =>
                                  ValidateCheck.validatePassword(
                                      value, context),
                            ),
                            Align(
                              alignment: Alignment.lerp(
                                  Alignment.center,
                                  (AppLanguage().appLocal == const Locale('en'))
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  .9)!,
                              child: TextButton(
                                  onPressed: () {
                                    cubit.navigateToForgetPasswordScreen(context);
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate('forget_password'),
                                    style: AppTextStyles.textButtonTextStyle,
                                  )),
                            ),
                            (state is LoginLoadingState)
                                ? const CustomLoader()
                                : ElevatedButton(
                                    onPressed: () {
                                      cubit.login(context);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate('login'),
                                      style:
                                          AppTextStyles.elevatedButtonTextStyle,
                                    )),
                          ],
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: AppLocalizations.of(context)
                              .translate('don\'t_have_account'),
                          style: AppTextStyles.textButtonTextStyle,
                          children: [
                            TextSpan(
                                text: AppLocalizations.of(context)
                                    .translate('register'),
                                style: AppTextStyles.textButtonTextStyle
                                    .copyWith(
                                        color: AppColors.complementaryColor2),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                  cubit.navigateToRegisterScreen(context);
                                  })
                          ]),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
