import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(AppAnimatedImages.noDataAnimation),
           Text(
           AppLocalizations.of(context).translate(AppStrings.noData),
            style: AppTextStyles.secondaryTextStyle,
          )
        ],
      ),
    );
  }
}
