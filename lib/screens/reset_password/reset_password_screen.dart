import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/password_field_validator.dart';
import 'package:flutter_sample/shared/validators/required_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final RxBool succeededReset = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: Center(
          child: Obx(
            () => Visibility(
              visible: succeededReset.value,
              child: _buildSucceedMessage(context),
              replacement: _buildPasswordsInput(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSucceedMessage(BuildContext context) {
    return Stack(
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
                    'Your request to update your\npassword is successful. Please\nlogin with your new password.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: 20 / 16,
                      color: AppColors.whiteTextColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.w, 30.w, 0.w, 20.w),
                    child: AppButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      gradient: AppColors.redGradient,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(45.w, 8.w, 45.w, 8.w),
                        alignment: Alignment.center,
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
                  ),
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
    );
  }

  Widget _buildPasswordsInput(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 195),
        Padding(
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
                    'Reset Password',
                    style: GoogleFonts.montserrat(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 30.w),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9.w),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: newPasswordController,
                            enabled: true,
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 18 / 14,
                              color: AppColors.whiteColor,
                            ),
                            validator: (value) =>
                                PasswordFieldValidator.validate(
                                    context, value!),
                            decoration: getInputOutlineDecoration(
                                    'Enter your new password')
                                .copyWith(errorMaxLines: 3),
                          ),
                          SizedBox(height: 20.w),
                          TextFormField(
                            controller: confirmNewPasswordFieldController,
                            enabled: true,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              formKey.currentState!.validate();
                            },
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 18 / 14,
                              color: AppColors.whiteColor,
                            ),
                            validator: (value) =>
                                RequiredConfirmFieldValidator.validate(
                                    context, value, newPasswordController.text),
                            decoration: getInputOutlineDecoration(
                                'Confirm your new password'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.w, 26.w, 0.w, 20.w),
                    child: AppButton(
                      onPressed: () {
                        succeededReset.value = formKey.currentState!.validate();
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
        ),
        Spacer(flex: 299),
      ],
    );
  }
}
