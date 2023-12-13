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

  int _timerValue = 240;

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
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSizeExtraLarge),
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
                  setState(() {});
                },
                onChanged: (value) {},
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
          ElevatedButton(onPressed: (){},
              child: Text(AppLocalizations.of(context).translate('confirm'),style: AppTextStyles.elevatedButtonTextStyle,))
        ],
      ),
    );
  }


}



