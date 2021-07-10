import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/required_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_sample/shared/widgets/app_check_box.dart';
import 'package:flutter_sample/shared/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferScreen extends StatelessWidget {
  TransferScreen({Key? key}) : super(key: key);

  final RxBool isAgreed = false.obs;
  final RxBool succeededTransfer = false.obs;
  final RxBool isLimited = false.obs;
  final RxString errorMessage = ''.obs;
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ff252c39,
      body: Stack(
        children: [
          Column(
            children: [
              AppTopBar(title: 'Enter Amount'),
              Expanded(
                child: Column(
                  children: [
                    buildTranserTo(context),
                    buildTransferAmountInput(context),
                    Spacer(),
                    buildActions(context),
                  ],
                ),
              ),
            ],
          ),
          Obx(() => Visibility(
                visible: succeededTransfer.value,
                child: _buildSucceedMessage(context),
                replacement: SizedBox(),
              )),
        ],
      ),
    );
  }

  Widget _buildSucceedMessage(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 42.w),
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
                        'SUCCESSFUL',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 44.0,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          color: AppColors.ffd7dde8,
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Text(
                        '1000 LT\nAlexa\nDate_Time',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          height: 20 / 16,
                          color: AppColors.ffd7dde8,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 30.w, 0.w, 25.w),
                        child: AppButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          gradient: AppColors.redGradient,
                          child: Text(
                            'OK',
                            style: GoogleFonts.montserrat(
                              fontSize: 15.0,
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
                      color: AppColors.ff505d75.withOpacity(0.2),
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
                      padding: EdgeInsets.only(top: 14.w, right: 7.w),
                      width: 127.w,
                      height: 127.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2)),
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
      ),
    );
  }

  Widget buildTranserTo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transfer To',
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              height: 18 / 16,
              letterSpacing: -0.17,
              color: AppColors.ffd7dde8,
            ),
          ),
          SizedBox(height: 10.w),
          Container(
            padding: EdgeInsets.fromLTRB(19.w, 29.w, 15.w, 29.w),
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
                    color: AppColors.ff505d75.withOpacity(0.2),
                  ),
                ]),
            child: Row(
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  child: Image.asset(AppAssets.imAvatarSample),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Alexa',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    height: 18 / 14,
                    letterSpacing: -0.17,
                    color: AppColors.ffd7dde8,
                  ),
                ),
                Spacer(),
                AppButton(
                  gradient: AppColors.infiniteGreyGradient,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'CHANGE',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                      color: AppColors.ffd7dde8,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransferAmountInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(11.w, 30.w, 11.w, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Transfer Amount',
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              height: 18 / 16,
              letterSpacing: -0.17,
              color: AppColors.ffd7dde8,
            ),
          ),
          SizedBox(height: 10.w),
          TextFormField(
            controller: amountController,
            enabled: true,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            style: GoogleFonts.bebasNeue(
              fontSize: 30.0,
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: AppColors.ffd7dde8,
            ),
            validator: (value) =>
                RequiredFieldValidator.validate(context, value!),
            decoration: getInputOutlineDecoration(
                    'Enter your withdrawal amount',
                    showHint: false)
                .copyWith(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 27.w, vertical: 0.0),
              suffixIcon: Image.asset(
                AppAssets.icToken,
                width: 15.w,
                height: 15.w,
              ),
            ),
          ),
          SizedBox(height: 10.w),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Visibility(
                visible: errorMessage.value.isEmpty,
                child: Column(
                  children: [
                    Text(
                      'Unlocked LiveToken : 500 Tokens',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        height: 18 / 12,
                        color: AppColors.ff8290aa,
                      ),
                    ),
                    SizedBox(height: 1.w),
                    Text(
                      'Daily transfer limit is 1000 Tokens',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        height: 18 / 12,
                        color: AppColors.ff8290aa,
                      ),
                    ),
                  ],
                ),
                replacement: Text(
                  '${errorMessage.value}',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    height: 18 / 12,
                    color: AppColors.ffec0000,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(21.w, 0.0, 21.w, 58.w),
      child: Column(children: [
        Row(
          children: [
            AppCheckBox(
              value: isAgreed,
            ),
            SizedBox(width: 10.w),
            Text(
              'I agree to terms & conditions.',
              style: GoogleFonts.montserrat(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                height: 18 / 12,
                color: AppColors.ff8290aa,
              ),
            ),
          ],
        ),
        SizedBox(height: 30.w),
        Container(height: 1.w, color: AppColors.ff505d75),
        SizedBox(height: 20.w),
        Obx(
          () => AppInfiniteButton(
            enable: !isLimited.value,
            onPressed: () {
              final amount = amountController.text.isNotEmpty
                  ? int.tryParse(amountController.text)!
                  : 0;
              if (isAgreed.value) {
                if (amount > 1000) {
                  errorMessage.value =
                      'You have exceeded your daily transfer limit. Please try again tomorrow.';
                  isLimited.value = true;
                } else {
                  if (amount > 500) {
                    errorMessage.value =
                        'Input transfer amount is higher than Unlocked LiveTokens.';
                  } else {
                    if (amount <= 0) {
                      errorMessage.value =
                          'Invalid amount. Please check again.';
                    } else {
                      errorMessage.value = '';
                      succeededTransfer.value = true;
                    }
                  }
                }
              } else {
                errorMessage.value = 'Agree to Terms & Conditons to proceed.';
              }
            },
            gradient: AppColors.redGradient,
            child: Container(
              padding: EdgeInsets.fromLTRB(40.w, 10.w, 40.w, 10.w),
              width: MediaQuery.of(context).size.width - 42.w,
              alignment: Alignment.center,
              child: Text(
                'TRANSFER',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  height: 22.4 / 16,
                  color: AppColors.ffd7dde8,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
