import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Center(
          child: Image.asset(AppImages.blackLightLogo),
        ),
      ]),
    );
  }
}
