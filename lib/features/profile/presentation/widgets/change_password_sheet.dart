import 'package:flutter/material.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class ChangePasswordSheet extends StatelessWidget {
  const ChangePasswordSheet({
    super.key,
  });

  static FocusNode oldPasswordNode = FocusNode();
  static FocusNode newPasswordNode = FocusNode();
  static FocusNode confirmPasswordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      height: MediaQuery.of(context).viewInsets.bottom + 300,
      decoration: const BoxDecoration(
          color: AppColors.darkerShadeColor1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeSmall),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                    color: AppColors.darkerShadeColor6,
                    borderRadius: BorderRadius.circular(20)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                AppLocalizations.of(context)
                    .translate(AppStrings.changePassword),
                style: const TextStyle(
                    color: AppColors.complementaryColor3,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                focusNode: oldPasswordNode,
                nextFocus: newPasswordNode,
                prefixIcon: Icons.lock,
                isPassword: true,
                labelText: AppLocalizations.of(context)
                    .translate(AppStrings.recentPassword),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                focusNode: newPasswordNode,
                prefixIcon: Icons.lock,
                nextFocus: confirmPasswordNode,
                isPassword: true,
                labelText: AppLocalizations.of(context)
                    .translate(AppStrings.newPassword),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                focusNode: confirmPasswordNode,
                prefixIcon: Icons.lock,
                isPassword: true,
                labelText: AppLocalizations.of(context)
                    .translate(AppStrings.confirmNewPassword),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)
                        .translate(AppStrings.changePassword),
                    style: AppTextStyles.elevatedButtonTextStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
