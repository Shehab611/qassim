import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AppImages.blackLightLogo),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    AppNavigator.navigateToLoginScreen(context);
                  },
                  child: Text(
                    AppLocalizations.of(context).translate(AppStrings.login),
                    style: AppTextStyles.elevatedButtonTextStyle,
                  )),
              ElevatedButton(
                  onPressed: () {
                    AppNavigator.navigateToRegisterScreen(context);
                  },
                  child: Text(
                    AppLocalizations.of(context).translate(AppStrings.register),
                    style: AppTextStyles.elevatedButtonTextStyle,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
