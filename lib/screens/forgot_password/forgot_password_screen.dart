import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/email_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.9),
          body: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.w),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
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
                gradient: LinearGradient(
                    begin: Alignment(-1.0, -1.0),
                    end: Alignment(-1.0, 1.0),
                    colors: [
                      Color(0xFFD7DDE8).withOpacity(0.25),
                      Color(0xFF7889A9).withOpacity(0.25),
                    ]),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(height: 26.0.w),
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.montserrat(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                    color: AppColors.whiteTextColor,
                  ),
                ),
                SizedBox(height: 20.0.w),
                Text(
                  'A reset password email link\nwill be sent to your registered\nemail account.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    height: 20 / 16,
                    color: AppColors.whiteTextColor,
                  ),
                ),
                SizedBox(height: 30.0.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.0.w),
                  child: TextFormField(
                    controller: emailFieldController,
                    enabled: true,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.0,
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
                Padding(
                  padding: EdgeInsets.fromLTRB(98.0.w, 50.0.w, 98.0.w, 32.0.w),
                  child: AppButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    gradient: AppColors.redButtonGradient,
                    child: Container(
                      height: 44.0.w,
                      alignment: Alignment.center,
                      child: Text(
                        'OK',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
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
    );
  }
}
