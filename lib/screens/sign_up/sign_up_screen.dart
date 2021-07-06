import 'dart:ui';

import 'package:country_provider/country_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/email_field_validator.dart';
import 'package:flutter_sample/shared/validators/password_field_validator.dart';
import 'package:flutter_sample/shared/validators/required_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_sample/shared/widgets/app_circular_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RxDouble topCor = 0.0.obs;
  final RxDouble leftCor = 0.0.obs;
  final RxBool showDialCodeList = false.obs;
  final RxBool _obscureText = true.obs;
  final RxBool _currentObscureText = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey phoneFieldKey = GlobalKey();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController phoneFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final TextEditingController confirmPasswordFieldController =
      TextEditingController();
  Country country = Country();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    try {
      final _temp = await CountryProvider.getCountriesByListOfCodes(['MY']);
      country = _temp.first;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          showDialCodeList.value = false;
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 44.w + MediaQuery.of(context).padding.top),
                    Center(
                        child: Image.asset(
                      AppAssets.imAppLogo,
                      width: 175.w,
                      height: 28.6.w,
                    )),
                    SizedBox(height: 25.14.w),
                    Center(
                      child: Text(
                        'Sign up to discover 10,000+\nlivestream video with us',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          color: AppColors.whiteTextColor1,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.w),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
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
                              style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
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
                            Container(
                              key: phoneFieldKey,
                              decoration: BoxDecoration(
                                color: AppColors.textFieldFillColor,
                                borderRadius: BorderRadius.circular(40.w),
                                border: Border.all(
                                    color: AppColors.whiteColor, width: 1.0),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      final RenderBox renderBox = phoneFieldKey
                                          .currentContext
                                          ?.findRenderObject() as RenderBox;
                                      final offset =
                                          renderBox.localToGlobal(Offset.zero);
                                      leftCor.value = offset.dx;
                                      topCor.value = offset.dy;
                                      showDialCodeList.value =
                                          !showDialCodeList.value;
                                    },
                                    child: SizedBox(
                                      width: 70.w,
                                      height: 40.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(width: 8.w),
                                          Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: AppColors.whiteColor,
                                          ),
                                          Text(
                                            '+60',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 18 / 14,
                                              color: AppColors.whiteTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: phoneFieldController,
                                      enabled: true,
                                      keyboardType: TextInputType.phone,
                                      textInputAction: TextInputAction.next,
                                      autocorrect: false,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 18 / 14,
                                        color: AppColors.whiteColor,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Mobile Number',
                                        hintStyle: GoogleFonts.montserrat(
                                          fontSize: 14.0.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 18 / 14,
                                          color: AppColors.greyTextColor,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.w),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.w),
                            Obx(() => TextFormField(
                                  controller: passwordFieldController,
                                  enabled: true,
                                  obscureText: _obscureText.value,
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
                                  decoration:
                                      getInputOutlineDecoration('Password')
                                          .copyWith(
                                              suffixIcon: IconButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 19.0),
                                    icon: Icon(_obscureText.value
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye),
                                    color: AppColors.greyColor,
                                    onPressed: () {
                                      _obscureText.value = !_obscureText.value;
                                    },
                                  )),
                                )),
                            SizedBox(height: 20.w),
                            Obx(() => TextFormField(
                                  controller: confirmPasswordFieldController,
                                  enabled: true,
                                  obscureText: _currentObscureText.value,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (_) {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.of(context)
                                          .pushNamed(Routes.verifyCode);
                                    }
                                  },
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 18 / 14,
                                    color: AppColors.whiteColor,
                                  ),
                                  validator: (value) =>
                                      RequiredConfirmFieldValidator.validate(
                                          context,
                                          value,
                                          passwordFieldController.text),
                                  decoration: getInputOutlineDecoration(
                                          'Confirm Password')
                                      .copyWith(
                                          suffixIcon: IconButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 19.0),
                                    icon: Icon(_currentObscureText.value
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye),
                                    color: AppColors.greyColor,
                                    onPressed: () {
                                      _currentObscureText.value =
                                          !_currentObscureText.value;
                                    },
                                  )),
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.w, 50.w, 0.w, 0.w),
                              child: AppButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.of(context)
                                        .pushNamed(Routes.verifyCode);
                                  }
                                },
                                gradient: AppColors.redGradient,
                                child: Text(
                                  'SIGN UP',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    height: 19.6 / 14,
                                    color: AppColors.whiteTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40.w),
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
                    SizedBox(height: 18.w),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Already a member? Login',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          height: 5 / 3,
                          color: AppColors.whiteTextColor,
                          letterSpacing: -0.17,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 23.71.w),
                  ],
                ),
              ),
              Obx(
                () => Positioned(
                  top: topCor.value + 55.w,
                  left: leftCor.value + 8.w,
                  child: Visibility(
                    visible: showDialCodeList.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.w),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          width: 67.w,
                          height: 163.w,
                          child: RawScrollbar(
                            thickness: 5.w,
                            thumbColor: AppColors.greyColor,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: 20,
                              itemBuilder: (context, index) => Container(
                                height: 32.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(3.w),
                                      child: SizedBox(
                                        width: 12.w,
                                        height: 8.67.w,
                                        child: SvgPicture.network(
                                          country.flag!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      '+ ${country.callingCodes!.first}',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.whiteTextColor),
                                    )
                                  ],
                                ),
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                height: 0.5.w,
                                color: AppColors.borderColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    replacement: SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
