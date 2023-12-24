import 'package:flutter/material.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';

class TextFieldWithIconButton extends StatelessWidget {
  const TextFieldWithIconButton(
      {super.key,
      required this.controller,
      required this.icon,
      required this.labelText,
      this.validator,
      this.onPressed,
      required this.enabled,
      this.buttonIcon = Icons.edit,
      this.isButtonVisible = true});

  final TextEditingController controller;

  final IconData icon;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function()? onPressed;
  final bool enabled;
  final bool isButtonVisible;
  final IconData buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            isEnabled: enabled,
            prefixIcon: icon,
            controller: controller,
            inputType: TextInputType.emailAddress,
            labelText: labelText,
            validator: validator,
          ),
        ),
        Visibility(
          visible: isButtonVisible,
          replacement: const CustomLoader(),
          child: IconButton(
            icon: Icon(
              buttonIcon,
              color: AppColors.complementaryColor2,
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
