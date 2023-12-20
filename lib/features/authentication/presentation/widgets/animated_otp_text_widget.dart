import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class AnimatedOtpTextWidget extends StatelessWidget {
  const AnimatedOtpTextWidget({
    super.key,
    required this.emailAddress,
  });

  final String emailAddress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .42,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(AppImages.otpAnimation,
              height: MediaQuery.of(context).size.height * .3),
          Text(
            AppLocalizations.of(context).translate(AppStrings.emailVerification),
            style: AppTextStyles.textButtonTextStyle.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          RichText(
              maxLines: 1,
              text: TextSpan(
                  text:
                      AppLocalizations.of(context).translate(AppStrings.codeSentTo),
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
    );
  }
}
