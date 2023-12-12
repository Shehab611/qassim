import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class ForgetPasswordFirstScreen extends StatelessWidget {
  const ForgetPasswordFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(AppImages.resetPasswordAnimation,),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      prefixIcon: Icons.alternate_email,
                      labelText: AppLocalizations.of(context).translate('email'),
                      validator:(value) =>ValidateCheck.validateEmail(value, context),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context).translate('continue'),
                          style: AppTextStyles.elevatedButtonTextStyle,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
