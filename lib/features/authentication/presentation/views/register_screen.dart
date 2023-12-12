import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/app_navigator.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.blackLightLogo,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.58,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingSizeDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                    prefixIcon: Icons.person,
                  labelText: AppLocalizations.of(context).translate('full_name'),
                    validator: (value) =>ValidateCheck.validateEmptyText(value, context, 'full_name_required') ,
                ),

                  CustomTextField(
                    prefixIcon: Icons.alternate_email,
                    labelText: AppLocalizations.of(context).translate('email'),
                    validator:(value) =>ValidateCheck.validateEmail(value, context),
                  ),
                  CustomTextField(
                    prefixIcon: Icons.call,
                    labelText: AppLocalizations.of(context).translate('phone_number'),
                    validator: (value) =>ValidateCheck.validateEmptyText(value, context, 'phone_number_required') ,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.lock,
                    labelText:
                    AppLocalizations.of(context).translate('password'),
                    isPassword: true,
                    validator:(value) =>ValidateCheck.validatePassword(value, context),
                  ),
                  CustomTextField(
                    prefixIcon: Icons.lock,
                    labelText:
                    AppLocalizations.of(context).translate('confirm_password'),
                    isPassword: true,
                    validator:(value) =>ValidateCheck.validateConfirmPassword(value, context,''),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).translate('register'),
                        style: AppTextStyles.elevatedButtonTextStyle,
                      )),
                ],
              ),
            ),
          ),
          RichText(
            text: TextSpan(
                text: AppLocalizations.of(context)
                    .translate('have_account'),
                style: AppTextStyles.textButtonTextStyle,
                children: [
                  TextSpan(
                      text: AppLocalizations.of(context).translate('login'),
                      style: AppTextStyles.textButtonTextStyle
                          .copyWith(color: AppColors.complementaryColor2),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        AppNavigator.navigateToLoginScreen(context);
                      })
                ]),
          ),
        ],)
      ),
    );
  }
}
