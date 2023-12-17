import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/features/authentication/presentation/widgets/animated_otp_text_widget.dart';
import 'package:qassim/features/authentication/presentation/widgets/otp_verification_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String emailAddress = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
        children: [
          AnimatedOtpTextWidget(emailAddress: emailAddress),
          OtpVerificationWidget(emailAddress: emailAddress)
        ],
      ),
    );
  }
}
