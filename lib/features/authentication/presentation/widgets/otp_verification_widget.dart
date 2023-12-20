import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/authentication/data/repositories/confirm_otp/confirm_otp_repo.dart';
import 'package:qassim/features/authentication/data/repositories/confirm_otp/confirm_otp_repo_impl.dart';
import 'package:qassim/features/authentication/data/repositories/forget_password/forget_password_repo.dart';
import 'package:qassim/features/authentication/data/repositories/forget_password/forget_password_repo_impl.dart';
import 'package:qassim/service_locator.dart';

class OtpVerificationWidget extends StatefulWidget {
  const OtpVerificationWidget({super.key, required this.emailAddress});

  final String emailAddress;

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PinTheme _pinTheme = PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(5),
      errorBorderColor: AppColors.complementaryColor3,
      inactiveFillColor: Colors.white,
      selectedFillColor: Colors.white,
      activeFillColor: Colors.white,
      selectedColor: AppColors.complementaryColor1,
      activeColor: AppColors.complementaryColor1,
      inactiveColor: AppColors.complementaryColor4);
  final TextEditingController _textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> _errorController;
  bool _reSendFlag = false;
  bool _isLoadingFlag = false;
  int _timerValue = 240;
  final ConfirmOtpRepo confirmOtpRepo = ConfirmOtpRepoImpl(sl<DioClient>());
  final ForgetPasswordRepo forgetPasswordRepo =
      ForgetPasswordRepoImpl(sl<DioClient>());

  Future<void> _confirmOtp() async {
    ApiResponse apiResponse = await confirmOtpRepo.confirmOtp(
        email: widget.emailAddress, otp: _textEditingController.text);
    if (apiResponse.response?.statusCode != null &&
        apiResponse.response?.statusCode == 200) {
      if (context.mounted) {
        AppNavigator.navigateToChangePasswordScreen(context,widget.emailAddress);
      }
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        _isLoadingFlag = false;
        setState(() {});
      }
    }
  }

  Future<void> _resendOtp() async {
    ApiResponse apiResponse = await forgetPasswordRepo.forgetPassword(
      email: widget.emailAddress,
    );
    if (apiResponse.response?.statusCode != null &&
        apiResponse.response?.statusCode == 200) {

    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        _isLoadingFlag = false;
        setState(() {});
      }
    }
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_timerValue < 1) {
            timer.cancel();
            _reSendFlag = true;
          } else {
            _timerValue = _timerValue - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 2,
        ));
    _errorController = StreamController<ErrorAnimationType>();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _errorController.close();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .37,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingSizeExtraLarge),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                animationType: AnimationType.fade,
                pinTheme: _pinTheme,
                cursorColor: AppColors.complementaryColor2,
                animationDuration: const Duration(milliseconds: 350),
                enableActiveFill: true,
                errorAnimationController: _errorController,
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v!.length < 6) {
                    ///do this in validation on code
                    return AppLocalizations.of(context)
                        .translate('otp_invalid');
                  } else {
                    return null;
                  }
                },
                onCompleted: (v) {
                  _formKey.currentState?.validate();
                  setState(() {});
                },
                onSubmitted: (v) {
                  if (v.length < 6) {
                    _errorController.add(ErrorAnimationType.shake);
                  }
                },
                onSaved: (v) {
                  if (v!.length < 6) {
                    _errorController.add(ErrorAnimationType.shake);
                  }
                },
                beforeTextPaste: (text) {
                  return true;
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).translate('didn\'t_rcv_code'),
                style: AppTextStyles.textButtonTextStyle,
              ),
              Visibility(
                visible: _reSendFlag,
                replacement: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingSizeDefault),
                  child: Text(
                    _timerValue.toString(),
                    style: AppTextStyles.textButtonTextStyle.copyWith(
                        color: AppColors.complementaryColor2, fontSize: 16),
                  ),
                ),
                child: TextButton(
                  onPressed: () async {
                    await _resendOtp();
                  },
                  child: Text(
                    AppLocalizations.of(context).translate('resend'),
                    style: AppTextStyles.textButtonTextStyle.copyWith(
                        color: AppColors.complementaryColor2, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
          _isLoadingFlag
              ? const CustomLoader()
              : ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoadingFlag = true;
                      });
                      await _confirmOtp();
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context).translate('confirm'),
                    style: AppTextStyles.elevatedButtonTextStyle,
                  ))
        ],
      ),
    );
  }
}
