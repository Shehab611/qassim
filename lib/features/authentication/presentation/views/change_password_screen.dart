import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
        child: SingleChildScrollView(
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
                      labelText:
                          AppLocalizations.of(context).translate('password'),
                      isPassword: true,
                      validator: (value) =>
                          ValidateCheck.validatePassword(value, context),
                    ),
                    CustomTextField(
                      prefixIcon: Icons.lock,
                      labelText: AppLocalizations.of(context)
                          .translate('confirm_password'),
                      isPassword: true,
                      validator: (value) =>
                          ValidateCheck.validateConfirmPassword(
                              value, context, ''),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('change_password'),
                          style: AppTextStyles.elevatedButtonTextStyle,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context).translate('cancel'),
                          style: AppTextStyles.textButtonTextStyle,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
