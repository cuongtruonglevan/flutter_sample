import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/required_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeDetailScreen extends StatelessWidget {
  WelcomeDetailScreen({Key? key}) : super(key: key);

  final GlobalKey countryKey = GlobalKey();
  final GlobalKey stateKey = GlobalKey();

  final RxBool showCountryList = false.obs;
  final RxBool showStateList = false.obs;
  final RxDouble topCor = 0.0.obs;
  final RxDouble leftCor = 0.0.obs;
  final RxString countryText = 'Country'.obs;
  final RxString stateText = 'State'.obs;

  final List<String> countryList = [
    'Malaysia',
    'Thailand',
    'Indonesia',
    'Laos',
    'Cambodia',
    'Singapore',
    'Philipins',
    'Myanmar',
    'Timo-Leste'
  ];
  final List<String> stateList = [
    'State-1',
    'State-2',
    'State-3',
    'State-4',
    'State-5',
    'State-6',
    'State-7',
    'State-8',
    'State-9',
  ];

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return GestureDetector(
      onTap: () {
        showCountryList.value = false;
        showStateList.value = false;
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          physics: ClampingScrollPhysics(),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppAssets.imWelcomeBackground,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w)
                    .copyWith(top: 91.w, bottom: 76.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.w),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: Colors.black.withOpacity(0.4),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2)),
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
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(21.w, 0.0, 20.w, 0.0),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(height: 25.w),
                          Center(
                            child: Text(
                              'Hello,\nwelcome aboard!',
                              style: GoogleFonts.montserrat(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w600,
                                height: 1.0,
                                color: AppColors.ffd7dde8,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.w),
                          Text(
                            'Let us know a little bit about you.',
                            style: GoogleFonts.montserrat(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              height: 20 / 16,
                              color: AppColors.ff7889a9,
                            ),
                          ),
                          SizedBox(height: 30.w),
                          TextFormField(
                            controller: TextEditingController(),
                            enabled: true,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              height: 18 / 14,
                              color: AppColors.ffd7dde8,
                            ),
                            validator: (value) =>
                                RequiredFieldValidator.validate(
                                    context, value!),
                            decoration:
                                getInputOutlineDecoration('Address Line 1')
                                    .copyWith(errorMaxLines: 3),
                          ),
                          SizedBox(height: 20.w),
                          TextFormField(
                            controller: TextEditingController(),
                            enabled: true,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              height: 18 / 14,
                              color: AppColors.ffd7dde8,
                            ),
                            validator: (value) =>
                                RequiredFieldValidator.validate(
                                    context, value!),
                            decoration:
                                getInputOutlineDecoration('Address Line 2')
                                    .copyWith(errorMaxLines: 3),
                          ),
                          SizedBox(height: 20.w),
                          InkWell(
                            key: countryKey,
                            onTap: () {
                              final RenderBox renderBox =
                                  countryKey.currentContext?.findRenderObject()
                                      as RenderBox;
                              final offset =
                                  renderBox.localToGlobal(Offset.zero);
                              leftCor.value = offset.dx;
                              topCor.value = offset.dy;
                              showStateList.value = false;
                              showCountryList.value = !showCountryList.value;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.ff2e394e,
                                borderRadius: BorderRadius.circular(40.w),
                                border: Border.all(
                                    color: countryText.value == 'Country'
                                        ? AppColors.ff7889a9
                                        : AppColors.ffd7dde8,
                                    width: 1.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 27.w, vertical: 15.w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          countryText.value,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            height: 18 / 14,
                                            color:
                                                countryText.value == 'Country'
                                                    ? AppColors.ff7889a9
                                                    : AppColors.ffd7dde8,
                                          ),
                                        ),
                                      ),
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Image.asset(
                                          AppAssets.icBack,
                                          color: AppColors.ff7889a9,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.w),
                          InkWell(
                            key: stateKey,
                            onTap: () {
                              final RenderBox renderBox =
                                  stateKey.currentContext?.findRenderObject()
                                      as RenderBox;
                              final offset =
                                  renderBox.localToGlobal(Offset.zero);
                              leftCor.value = offset.dx;
                              topCor.value = offset.dy;
                              showCountryList.value = false;
                              showStateList.value = !showStateList.value;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.ff2e394e,
                                borderRadius: BorderRadius.circular(40.w),
                                border: Border.all(
                                    color: stateText.value == 'State'
                                        ? AppColors.ff7889a9
                                        : AppColors.ffd7dde8,
                                    width: 1.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 27.w, vertical: 15.w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          stateText.value,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            height: 18 / 14,
                                            color: stateText.value == 'State'
                                                ? AppColors.ff7889a9
                                                : AppColors.ffd7dde8,
                                          ),
                                        ),
                                      ),
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Image.asset(
                                          AppAssets.icBack,
                                          color: AppColors.ff7889a9,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.w),
                          TextFormField(
                            controller: TextEditingController(),
                            enabled: true,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              height: 18 / 14,
                              color: AppColors.ffd7dde8,
                            ),
                            validator: (value) =>
                                RequiredFieldValidator.validate(
                                    context, value!),
                            decoration: getInputOutlineDecoration('City')
                                .copyWith(errorMaxLines: 3),
                          ),
                          SizedBox(height: 20.w),
                          TextFormField(
                            controller: TextEditingController(),
                            enabled: true,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              height: 18 / 14,
                              color: AppColors.ffd7dde8,
                            ),
                            validator: (value) =>
                                RequiredFieldValidator.validate(
                                    context, value!),
                            decoration: getInputOutlineDecoration('Zip Code')
                                .copyWith(errorMaxLines: 3),
                          ),
                          SizedBox(height: 20.w),
                          TextFormField(
                            controller: TextEditingController(),
                            enabled: true,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              height: 18 / 14,
                              color: AppColors.ffd7dde8,
                            ),
                            decoration: getInputOutlineDecoration(
                                    'Referal Code (Optional)')
                                .copyWith(errorMaxLines: 3),
                          ),
                          SizedBox(height: 50.w),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w, right: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text(
                                    'BACK',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      height: 19.6 / 14,
                                      color: AppColors.ffd7dde8,
                                    ),
                                  ),
                                ),
                                AppButton(
                                    child: Text(
                                      'SAVE',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        height: 19.6 / 14,
                                        color: AppColors.ffd7dde8,
                                      ),
                                    ),
                                    gradient: AppColors.redGradient,
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(height: 26.w),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(() => Positioned(
                    top: topCor.value + 55.w,
                    left: leftCor.value + 1.w,
                    right: leftCor.value,
                    child: Visibility(
                      visible: showCountryList.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.w),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            height: 206.w,
                            child: RawScrollbar(
                              thickness: 5.w,
                              thumbColor: AppColors.ff7889a9,
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: countryList.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    countryText.value =
                                        countryList.elementAt(index);
                                    showCountryList.value = false;
                                  },
                                  child: Container(
                                    height: 49.w,
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 17.w),
                                      child: Text(
                                        countryList.elementAt(index),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.ffd7dde8),
                                      ),
                                    ),
                                  ),
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 17.w),
                                  height: 0.5.w,
                                  color: AppColors.ff505d75,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      replacement: SizedBox(),
                    ),
                  )),
              Obx(() => Positioned(
                    top: topCor.value + 55.w,
                    left: leftCor.value + 1.w,
                    right: leftCor.value,
                    child: Visibility(
                      visible: showStateList.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.w),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            height: 206.w,
                            child: RawScrollbar(
                              thickness: 5.w,
                              thumbColor: AppColors.ff7889a9,
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: stateList.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    stateText.value =
                                        stateList.elementAt(index);
                                    showStateList.value = false;
                                  },
                                  child: Container(
                                    height: 49.w,
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 17.w),
                                      child: Text(
                                        stateList.elementAt(index),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.ffd7dde8),
                                      ),
                                    ),
                                  ),
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 17.w),
                                  height: 0.5.w,
                                  color: AppColors.ff505d75,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      replacement: SizedBox(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
