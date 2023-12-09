import 'package:flutter/material.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/utils/app_localization.dart';
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
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(AppImages.blackLightLogo,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.465,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSizeDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                    labelText:AppLocalizations.of(context).translate('email'),

                  ),
                  CustomTextField(
                    labelText:AppLocalizations.of(context).translate('password'),
                    isPassword: true,
                  ),
                  TextButton(onPressed: (){}, child: Text('rgloijigor')),
                  ElevatedButton(onPressed: (){}, child: Text('fffjh',style: AppTextStyles.elevatedButtonTextStyle,)),
                ],
              ),
            ),
          ),
          TextButton(onPressed: (){}, child: Text('rgloijigor')),

        ]),
      ),
    );
  }
}
