import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class OtpVerificationWidget extends StatefulWidget {
  const OtpVerificationWidget({super.key});

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;
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
  bool _isValidate = false;
  bool _reSendFlag = false;

  int _timerValue = 240;

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
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
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
                    _errorController.add(ErrorAnimationType.shake);
                    return AppLocalizations.of(context)
                        .translate('otp_invalid');
                  } else {
                    return null;
                  }
                },
                onCompleted: (v) {
                  _formKey.currentState?.validate();
                  initSlidingAnimation();
                  _isValidate = true;
                  setState(() {});
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
              )),
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
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSizeDefault),
                child: Text(
                  _timerValue.toString(),
                  style: AppTextStyles.textButtonTextStyle.copyWith(
                      color: AppColors.complementaryColor2, fontSize: 16),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context).translate('resend'),
                  style: AppTextStyles.textButtonTextStyle.copyWith(
                      color: AppColors.complementaryColor2, fontSize: 16),
                ),
              ),
            )
          ],
        ),
        (_isValidate)
            ? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SlidingAnimationButton(
                  slidingAnimation: _slidingAnimation,
                  onPressedFunction: () {},
                ),
              )
            : const Center()
      ],
    );
  }

  void initSlidingAnimation() {
    _slidingAnimation =
        Tween<Offset>(begin: const Offset(-5, 0), end: Offset.zero)
            .animate(_animationController);
    _animationController.forward();
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
      String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
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
}

class SlidingAnimationButton extends StatelessWidget {
  const SlidingAnimationButton(
      {super.key,
      required this.slidingAnimation,
      required this.onPressedFunction});

  final Animation<Offset> slidingAnimation;
  final void Function() onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child:ElevatedButton(onPressed: (){},
              child: Text(AppLocalizations.of(context).translate('confirm'),style: AppTextStyles.elevatedButtonTextStyle,)),
        );
      },
    );
  }
}
