import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';

class CompleteBookingSheet extends StatelessWidget {
  const CompleteBookingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).viewInsets.bottom,
      decoration: const BoxDecoration(
          color: AppColors.darkerShadeColor1, borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeSmall),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 5,
              decoration:
                  BoxDecoration(color: AppColors.darkerShadeColor6, borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context).translate(AppStrings.completeBooking),
              style: const TextStyle(
                  color: AppColors.complementaryColor3, fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
