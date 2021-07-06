import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/models/model.dart';
import 'package:flutter_sample/screens/auth/auth_bloc.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/email_field_validator.dart';
import 'package:flutter_sample/shared/validators/required_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_sample/shared/widgets/app_circular_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final RxBool _obscureText = true.obs;
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: ScreenUtil().screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Spacer(flex: 7),
                Center(
                    child: Image.asset(
                  AppAssets.imAppLogo,
                  width: 175.w,
                  height: 28.6.w,
                )),
                SizedBox(height: 29.26.w),
                Center(
                  child: Text(
                    'Login to discover 10,000+\nlivestream video with us',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      height: 1.25,
                      color: AppColors.whiteTextColor1,
                    ),
                  ),
                ),
                SizedBox(height: 29.92.w),
                Container(
                  padding: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 25.33.w),
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: AppColors.blackGradient,
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
                      ]),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailFieldController,
                          enabled: true,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          autofocus: false,
                          style: GoogleFonts.montserrat(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                            height: 18 / 14,
                            color: AppColors.whiteColor,
                          ),
                          validator: (value) =>
                              EmailFieldValidator.validate(context, value!),
                          decoration: getInputOutlineDecoration(
                              'Enter your email here'),
                        ),
                        SizedBox(height: 20.w),
                        Obx(() => TextFormField(
                              controller: passwordFieldController,
                              enabled: true,
                              autofocus: false,
                              obscureText: _obscureText.value,
                              style: GoogleFonts.montserrat(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w400,
                                height: 18 / 14,
                                color: AppColors.whiteColor,
                              ),
                              validator: (value) =>
                                  RequiredFieldValidator.validate(
                                      context, value),
                              decoration: getInputOutlineDecoration('Password')
                                  .copyWith(
                                      suffixIcon: IconButton(
                                padding: EdgeInsets.symmetric(horizontal: 19.0),
                                icon: Icon(_obscureText.value
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye),
                                color: AppColors.greyColor,
                                onPressed: () {
                                  _obscureText.value = !_obscureText.value;
                                },
                              )),
                              onFieldSubmitted: (_) {
                                if (formKey.currentState!.validate()) {
                                  final user = User('01', 'test.test@gmail.com',
                                      'Test', 'Test');
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(DidAuthenticate(user));
                                } else {
                                  return;
                                }
                              },
                            )),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(80.w, 50.w, 80.w, 20.49.w),
                          child: AppButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final user = User('01', 'test.test@gmail.com',
                                    'Test', 'Test');
                                BlocProvider.of<AuthBloc>(context)
                                    .add(DidAuthenticate(user));
                              } else {
                                return;
                              }
                            },
                            gradient: AppColors.redGradient,
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.montserrat(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w600,
                                height: 19.6 / 14,
                                color: AppColors.whiteTextColor,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.of(context)
                                .pushNamed(Routes.forgotPassword);
                            await Future.delayed(Duration(milliseconds: 500));
                            Navigator.of(context)
                                .pushNamed(Routes.resetPassword);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: AppColors.whiteTextColor1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.79.w)
                            .copyWith(bottom: 2.w),
                        child: Text(
                          'or login with',
                          style: GoogleFonts.montserrat(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppCircularButton(
                        onPressed: () {},
                        child: Container(
                          width: 57.w,
                          height: 57.w,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppAssets.icFacebook,
                            width: 15.w,
                            height: 26.w,
                          ),
                        ),
                      ),
                      AppCircularButton(
                        onPressed: () {},
                        child: Container(
                          width: 57.w,
                          height: 57.w,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppAssets.icGoogle,
                            width: 25.48.w,
                            height: 26.w,
                          ),
                        ),
                      ),
                      AppCircularButton(
                        onPressed: () {},
                        child: Container(
                          width: 57.w,
                          height: 57.w,
                          padding: EdgeInsets.only(bottom: 5.w),
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppAssets.icApple,
                            width: 21.w,
                            height: 26.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 3),
                InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.signUp);
                  },
                  child: Text(
                    'Not a member? Sign up',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: 20 / 12,
                      color: AppColors.whiteColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 36.71.w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
