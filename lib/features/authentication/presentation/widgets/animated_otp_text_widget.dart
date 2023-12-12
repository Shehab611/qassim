import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class AnimatedOtpTextWidget extends StatelessWidget {
  const AnimatedOtpTextWidget({
    super.key,
    required this.emailAddress,
  });

  final String emailAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .42,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(AppImages.otpAnimation,
                height: MediaQuery.of(context).size.height * .3),
            Text(
              AppLocalizations.of(context).translate('email_verification'),
              style: AppTextStyles.textButtonTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            RichText(
                maxLines: 1,
                text: TextSpan(
                    text:
                        AppLocalizations.of(context).translate('code_send_to'),
                    style: AppTextStyles.textButtonTextStyle,
                    children: [
                      TextSpan(
                          text: emailAddress.replaceRange(
                              3, emailAddress.indexOf('@') - 2, '********'),
                          style: AppTextStyles.textButtonTextStyle.copyWith(
                              color: AppColors.complementaryColor2,
                              fontSize: 12))
                    ]))
          ],
        ),
      ),
    );
  }
}
