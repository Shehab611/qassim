import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/app_navigator.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                    labelText: AppLocalizations.of(context).translate('email'),
                  ),
                  CustomTextField(
                    labelText:
                        AppLocalizations.of(context).translate('password'),
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.lerp(
                        Alignment.center,
                        (AppLanguage().appLocal == const Locale('en'))
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        .9)!,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('forget_password'),
                          style: AppTextStyles.textButtonTextStyle,
                        )),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).translate('login'),
                        style: AppTextStyles.elevatedButtonTextStyle,
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
                      text: AppLocalizations.of(context).translate('register'),
                      style: AppTextStyles.textButtonTextStyle
                          .copyWith(color: AppColors.complementaryColor1),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        AppNavigator.navigateToRegisterScreen(context);
                      })
                ]),
          ),
        ]),
      ),
    );
  }
}
