import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguagePickerScreen extends StatelessWidget {
  LanguagePickerScreen({Key? key}) : super(key: key);

  final List<SelectLanguage> languages = [
    SelectLanguage('Bahasa Malaysia', false.obs),
    SelectLanguage('English (default)', true.obs),
    SelectLanguage('中文 (简)', false.obs),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                child: Image.asset(
                  AppAssets.imSplashBackground,
                  fit: BoxFit.cover,
                  color: Color(0xFFC4C4C4),
                  colorBlendMode: BlendMode.colorBurn,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 126),
                Image.asset(
                  AppAssets.imAppLogoSplash,
                  width: 249.33.w,
                  height: 34.w,
                ),
                Spacer(flex: 134),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.w),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.2)),
                          color: Colors.white.withOpacity(0.5),
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
                              color: AppColors.ff505d75.withOpacity(0.2),
                            ),
                          ],
                          gradient: AppColors.lightGreyGradient,
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(height: 20.w),
                          Text(
                            'Select Language',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              height: 1.0,
                              color: AppColors.ffd7dde8,
                            ),
                          ),
                          ...languages
                              .map((e) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 48.w),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero),
                                      onPressed: () {
                                        if (e.isSelected.value) {
                                          return;
                                        } else {
                                          languages.forEach((element) {
                                            element.isSelected.value = false;
                                          });
                                          e.isSelected.value = true;
                                        }
                                      },
                                      child: SizedBox(
                                        height: 49.w,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '${e.language}',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 18 / 14,
                                                      letterSpacing: -0.17,
                                                      color: AppColors
                                                          .ffd7dde8,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Obx(
                                                    () => Visibility(
                                                      visible:
                                                          e.isSelected.value,
                                                      child: Icon(
                                                          Icons.check_rounded,
                                                          color: AppColors
                                                              .ffd7dde8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 1.0,
                                              color: AppColors.ff505d75,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.w),
                            child: AppButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(Routes.signIn);
                              },
                              gradient: AppColors.redGradient,
                              child: Text(
                                'CONTINUE',
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 19.6 / 14,
                                  color: AppColors.ffd7dde8,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 240),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectLanguage {
  final String language;
  final RxBool isSelected;

  SelectLanguage(this.language, this.isSelected);
}
