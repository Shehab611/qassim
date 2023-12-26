import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class CompleteBookingSheet extends StatelessWidget {
  const CompleteBookingSheet({super.key});

  static String _selectedTime = 'Morning';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).viewInsets.bottom + 200,
      decoration: const BoxDecoration(
          color: AppColors.darkerShadeColor1, borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeSmall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppLocalizations.of(context).translate(AppStrings.pickTime),
                  style: AppTextStyles.secondaryTextStyle,
                ),
                DropdownButton<String>(
                  value: _selectedTime,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  style: AppTextStyles.secondaryTextStyle,
                  underline: Container(
                    height: 2,
                    color: AppColors.complementaryColor3,
                  ),
                  dropdownColor: AppColors.darkerShadeColor1,
                  onChanged: (String? newValue) {
                    _selectedTime = newValue!;
                  },
                  items: <String>[
                    AppLocalizations.of(context).translate(AppStrings.morningTime),
                    AppLocalizations.of(context).translate(AppStrings.eveningTime)
                  ] // Your options
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context).translate(AppStrings.confirm),
                  style: AppTextStyles.elevatedButtonTextStyle,
                ))
          ],
        ),
      ),
    );
  }
}
