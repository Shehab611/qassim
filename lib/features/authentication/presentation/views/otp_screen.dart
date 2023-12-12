import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/features/authentication/presentation/widgets/animated_otp_text_widget.dart';
import 'package:qassim/features/authentication/presentation/widgets/otp_verification_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 20,
        elevation: 0,
      ),
      body:  ListView(
        padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
        children:const [
           AnimatedOtpTextWidget(emailAddress: 'shehabehab1029@gmail.com'),
          OtpVerificationWidget()
        ],
      ),
    );
  }
}


