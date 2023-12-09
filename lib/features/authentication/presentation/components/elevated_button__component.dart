import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class ElevatedTextButtonComponent extends StatelessWidget {
  const ElevatedTextButtonComponent({
    super.key,
    required this.text,
    this.textStyle = AppTextStyles.elevatedButtonTextStyle,
    this.onPressed,
    this.buttonStyle,
  });

  final String text;
  final void Function()? onPressed;
  final TextStyle textStyle;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
                backgroundColor: AppColors.elevatedButtonBackground),
        child: Text(
          text,
          style: textStyle,
        ));
  }
}
