import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.complementaryColor1,
      ),
    );
  }
}
