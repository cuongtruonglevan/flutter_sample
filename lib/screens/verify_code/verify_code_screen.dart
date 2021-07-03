import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/models/model.dart';
import 'package:flutter_sample/screens/auth/auth_bloc.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/widgets/app_top_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeScreen extends StatefulWidget {
  VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final RxBool emailVerified = false.obs;
  final RxInt resendCodeCountDown = 60.obs;
  final TextEditingController emailCodeController = TextEditingController();
  final TextEditingController phoneCodeController = TextEditingController();
  late Timer resendTimer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    resendTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTopBar(title: ''),
            _buildHeader(),
            _buildCodeInput(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Obx(
      () => Visibility(
        visible: emailVerified.value,
        child: Column(
          children: [
            Image.asset(
              AppAssets.imPhoneOTPHeader,
              width: 151.93.w,
              height: 158.1.w,
            ),
            SizedBox(height: 30.92.w),
            Text(
              'GREAT!',
              style: GoogleFonts.bebasNeue(
                fontSize: 44.0,
                fontWeight: FontWeight.w700,
                height: 0.41,
                letterSpacing: 1.0,
                color: AppColors.whiteTextColor,
              ),
            ),
            SizedBox(height: 15.0.w),
            Text(
              'JUST 1 MORE STEP!',
              style: GoogleFonts.bebasNeue(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                height: 0.6,
                letterSpacing: 1.0,
                color: AppColors.whiteTextColor,
              ),
            ),
          ],
        ),
        replacement: Column(
          children: [
            Image.asset(
              AppAssets.imEmailOTPHeader,
              width: 161.4.w,
              height: 140.52.w,
            ),
            SizedBox(height: 44.65.w),
            Text(
              'LET\'S GET GOING!',
              style: GoogleFonts.bebasNeue(
                fontSize: 44.0,
                fontWeight: FontWeight.w700,
                height: 0.41,
                letterSpacing: 1.0,
                color: AppColors.whiteTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeInput(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: emailVerified.value,
        child: _buildPhoneInput(),
        replacement: _buildEmailInput(),
      ),
    );
  }

  Widget _buildPhoneInput() => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.0)
                .copyWith(top: 37.0.w, bottom: 85.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.check, color: Color(0xFF1ADB96)),
                    SizedBox(width: 8.0.w),
                    Text(
                      'Verify your email address',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 20 / 16,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25.0.w, 18.0.w, 25.0.w, 14.0.w),
            margin:
                EdgeInsets.symmetric(horizontal: 20.0.w).copyWith(top: 12.0.w, bottom: 59.0.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: AppColors.blackGradient,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0.w,
                  spreadRadius: 5.0.w,
                  offset: Offset(5.0.w, 5.0.w),
                  color: Colors.black.withOpacity(0.4),
                ),
                BoxShadow(
                  blurRadius: 20.0.w,
                  spreadRadius: 7.0.w,
                  offset: Offset(-7.0.w, -7.0.w),
                  color: AppColors.borderColor.withOpacity(0.2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '2',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 20 / 16,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                    SizedBox(width: 8.0.w),
                    Text(
                      'Verify your mobile number',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 20 / 16,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  'A 6-digit code will be sent to\n+6012 345 6789',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    height: 20 / 14,
                    color: AppColors.whiteTextColor,
                  ),
                ),
                SizedBox(height: 17.0.w),
                PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: phoneCodeController,
                    textStyle: GoogleFonts.bebasNeue(
                      fontSize: 44.0,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      letterSpacing: 1.0,
                      color: AppColors.whiteTextColor,
                    ),
                    pinTheme: PinTheme.defaults(
                      shape: PinCodeFieldShape.box,
                      borderWidth: 1.0,
                      fieldWidth: 40.63.w,
                      fieldHeight: 60.0.w,
                      borderRadius: BorderRadius.circular(5.0),
                      // activeFillColor: AppColors.whiteColor,
                      // inactiveFillColor: AppColors.whiteColor,
                      // selectedFillColor: AppColors.whiteColor,
                      inactiveColor: AppColors.borderColor,
                      activeColor: AppColors.whiteColor,
                      selectedColor: AppColors.whiteColor,
                    ),
                    showCursor: false,
                    backgroundColor: Colors.transparent,
                    onChanged: (text) {
                      if (text == '111111') {
                        final user =
                            User('01', 'test.test@gmail.com', 'Test', 'Test');
                        BlocProvider.of<AuthBloc>(context)
                            .add(DidAuthenticate(user));
                      }
                    }),
                Obx(
                  () => Visibility(
                    visible: resendCodeCountDown.value != 0,
                    child: Center(
                      child: Text(
                        'Resend Code in 0:${_getTimerAsString(resendCodeCountDown.value)}',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 20 / 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    replacement: Center(
                      child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          _startTimer();
                        },
                        child: Text(
                          'RESEND NOW',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            height: 20 / 14,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildEmailInput() => Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(25.0.w, 18.0.w, 25.0.w, 17.0.w),
            margin:
                EdgeInsets.symmetric(horizontal: 20.0.w).copyWith(top: 12.0.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: AppColors.blackGradient,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0.w,
                  spreadRadius: 5.0.w,
                  offset: Offset(5.0.w, 5.0.w),
                  color: Colors.black.withOpacity(0.4),
                ),
                BoxShadow(
                  blurRadius: 20.0.w,
                  spreadRadius: 7.0.w,
                  offset: Offset(-7.0.w, -7.0.w),
                  color: AppColors.borderColor.withOpacity(0.2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '1',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 20 / 16,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                    SizedBox(width: 8.0.w),
                    Text(
                      'Verify your email address',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 20 / 16,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  'A 6-digit code will be sent to\nmail@email.com',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    height: 20 / 14,
                    color: AppColors.whiteTextColor,
                  ),
                ),
                SizedBox(height: 17.0.w),
                PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: emailCodeController,
                    textStyle: GoogleFonts.bebasNeue(
                      fontSize: 44.0,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      letterSpacing: 1.0,
                      color: AppColors.whiteTextColor,
                    ),
                    pinTheme: PinTheme.defaults(
                      shape: PinCodeFieldShape.box,
                      borderWidth: 1.0,
                      fieldWidth: 40.63.w,
                      fieldHeight: 60.0.w,
                      borderRadius: BorderRadius.circular(5.0),
                      // activeFillColor: AppColors.whiteColor,
                      // inactiveFillColor: AppColors.whiteColor,
                      // selectedFillColor: AppColors.whiteColor,
                      inactiveColor: AppColors.borderColor,
                      activeColor: AppColors.whiteColor,
                      selectedColor: AppColors.whiteColor,
                    ),
                    showCursor: false,
                    backgroundColor: Colors.transparent,
                    onChanged: (text) {
                      if (text == '111111') {
                        emailVerified.value = true;
                        resendTimer.cancel();
                        _startTimer();
                      }
                    }),
                Obx(
                  () => Visibility(
                    visible: resendCodeCountDown.value != 0,
                    child: Center(
                      child: Text(
                        'Resend Code in 0:${_getTimerAsString(resendCodeCountDown.value)}',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 20 / 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    replacement: Center(
                      child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          _startTimer();
                        },
                        child: Text(
                          'RESEND NOW',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            height: 20 / 14,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 45.0).copyWith(top: 40.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '2',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 20 / 16,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                    SizedBox(width: 8.0.w),
                    Text(
                      'Verify your mobile number',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 20 / 16,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  'A 6-digit code will be sent to\n+6012 345 6789',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    height: 20 / 14,
                    color: AppColors.greyTextColor,
                  ),
                ),
              ],
            ),
          )
        ],
      );

  void _startTimer() {
    resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      resendCodeCountDown.value = 60 - timer.tick;
      if (resendCodeCountDown.value == 0) {
        resendTimer.cancel();
      }
    });
  }

  String _getTimerAsString(int value) {
    if (value > 9) {
      return value.toString();
    } else {
      return '0${value.toString()}';
    }
  }
}
