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
import 'package:qassim/features/authentication/presentation/view_model_manger/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
        child: SingleChildScrollView(
          child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              ForgetPasswordCubit cubit = ForgetPasswordCubit.get(context);
              return Column(
                children: [
                  Lottie.asset(
                    AppImages.resetPasswordAnimation,
                  ),
                  Form(
                    key: cubit.formKey,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                            controller: cubit.emailController,
                            prefixIcon: Icons.alternate_email,
                            inputType: TextInputType.emailAddress,
                            labelText:
                                AppLocalizations.of(context).translate('email'),
                            validator: (value) =>
                                ValidateCheck.validateEmail(value, context),
                          ),
                          (state is ForgetPasswordLoadingState)
                              ? const CustomLoader()
                              : ElevatedButton(
                                  onPressed: () {
                                    cubit.forgetPassword(context);
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate('continue'),
                                    style:
                                        AppTextStyles.elevatedButtonTextStyle,
                                  )),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        cubit.navigateToLoginScreen(context);
                      },
                      child: Text(
                        AppLocalizations.of(context).translate('cancel'),
                        style: AppTextStyles.textButtonTextStyle,
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
