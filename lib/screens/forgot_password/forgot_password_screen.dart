import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/email_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final RxBool succeededForgot = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: Center(
          child: Obx(
            () => Visibility(
              visible: succeededForgot.value,
              child: _buildSucceedMessage(context),
              replacement: _buildEmailInput(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSucceedMessage(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 210),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 42.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 105.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.w,
                          spreadRadius: 5.w,
                          offset: Offset(5.w, 5.w),
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ],
                      gradient: AppColors.lightGreyGradient,
                    ),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        'RESET PASSWORD',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 44.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Text(
                        'The Reset Password link has\nbeen sent to your registerd\n email.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 20 / 16,
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                      SizedBox(height: 30.w),
                      AppButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        gradient: AppColors.redGradient,
                        child: Text(
                          'OK',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: 19.6 / 14,
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.w),
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.w,
                      spreadRadius: 5.w,
                      offset: Offset(5.w, 5.w),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    BoxShadow(
                      blurRadius: 20.w,
                      spreadRadius: 7.w,
                      offset: Offset(-7.w, -7.w),
                      color: AppColors.borderColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    127.w,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 127.w,
                      height: 127.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                        gradient: AppColors.lightGreyGradient,
                      ),
                      child: Center(
                        child: Image.asset(AppAssets.imCheckCircle),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(flex: 238),
      ],
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.w,
                  spreadRadius: 5.w,
                  offset: Offset(5.w, 5.w),
                  color: Colors.black.withOpacity(0.4),
                ),
                BoxShadow(
                  blurRadius: 20.w,
                  spreadRadius: 7.w,
                  offset: Offset(-7.w, -7.w),
                  color: AppColors.borderColor.withOpacity(0.2),
                ),
              ],
              gradient: AppColors.lightGreyGradient,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(height: 26.w),
              Text(
                'Forgot Password?',
                style: GoogleFonts.montserrat(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.0,
                  color: AppColors.whiteTextColor,
                ),
              ),
              SizedBox(height: 20.w),
              Text(
                'A reset password email link\nwill be sent to your registered\nemail account.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 20 / 16,
                  color: AppColors.whiteTextColor,
                ),
              ),
              SizedBox(height: 30.w),
              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: TextFormField(
                    controller: emailFieldController,
                    enabled: true,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 18 / 14,
                      color: AppColors.whiteColor,
                    ),
                    validator: (value) =>
                        EmailFieldValidator.validate(context, value!),
                    decoration:
                        getInputOutlineDecoration('Enter your email here'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.w, 50.w, 0.w, 32.w),
                child: AppButton(
                  onPressed: () {
                    succeededForgot.value = formKey.currentState!.validate();
                  },
                  gradient: AppColors.redGradient,
                  child: Text(
                    'OK',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 19.6 / 14,
                      color: AppColors.whiteTextColor,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
