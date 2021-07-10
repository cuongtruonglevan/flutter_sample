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

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({Key? key}) : super(key: key);

  final GlobalKey selectBankKey = GlobalKey();
  final RxString selectedBank = 'SELECT BANK'.obs;
  final RxBool selectingBank = false.obs;
  final RxBool isAgreed = false.obs;
  final RxBool succeededWithdraw = false.obs;
  final RxBool isLimited = false.obs;
  final RxString errorMessage = ''.obs;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountHolderNameController =
      TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  final List<String> banks = [
    'Agrobank',
    'AmBank (M) Berhad',
    'Alliance Bank Malaysia Berhad',
    'Affin Bank Berhad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ff252c39,
      body: Stack(
        children: [
          Column(
            children: [
              AppTopBar(title: 'Withdraw'),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 10.w),
                    buildWithdrawalInput(context),
                    SizedBox(height: 20.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(21.w, 19.w, 21.w, 0.w),
                        decoration: BoxDecoration(
                          color: AppColors.ff181e28,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: 44.w),
                          child: Column(
                            children: [
                              buildBankInformation(context),
                              SizedBox(height: 86.w),
                              buildActions(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(() => Visibility(
                visible: succeededWithdraw.value,
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
                        'SUCCESSFUL\nWITHDRAWAL',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 44.0,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          color: AppColors.ffd7dde8,
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Text(
                        'Your withdrawal request is\nbeing processed',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          height: 20 / 16,
                          color: AppColors.ffd7dde8,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 30.w, 0.w, 20.w),
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

  Widget buildWithdrawalInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Withdrawal Amount (LT)',
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
            decoration:
                getInputOutlineDecoration('Amount', showHint: false).copyWith(
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
          Text(
            'Unlocked LiveToken : 1200 Tokens',
            style: GoogleFonts.montserrat(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              height: 18 / 12,
              color: AppColors.ff8290aa,
            ),
          ),
          SizedBox(height: 1.w),
          Obx(
            () => Visibility(
              visible: errorMessage.value == '',
              child: Text(
                'Maximum daily withdrawal limit is 1500 Tokens',
                style: GoogleFonts.montserrat(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  height: 18 / 12,
                  color: AppColors.ff8290aa,
                ),
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
        ],
      ),
    );
  }

  Widget buildBankInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bank Information',
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            height: 18 / 16,
            letterSpacing: -0.17,
            color: AppColors.ffd7dde8,
          ),
        ),
        SizedBox(height: 20.w),
        Obx(
          () => AppInfiniteButton(
            key: selectBankKey,
            onPressed: () {
              final RenderBox renderBox =
                  selectBankKey.currentContext?.findRenderObject() as RenderBox;
              final offset = renderBox.localToGlobal(Offset.zero);
              final height = ScreenUtil().screenHeight - offset.dy - 64.w;
              selectingBank.value = !selectingBank.value;
              showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          height: height,
                          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 44.w),
                          decoration: BoxDecoration(
                            color: AppColors.ff181e28,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'A',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.0,
                                  height: 18 / 16,
                                  letterSpacing: -0.17,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.ffd7dde8,
                                ),
                              ),
                              ListView.builder(
                                itemCount: banks.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) => TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                  onPressed: () {
                                    selectedBank.value = banks.elementAt(index);
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.w),
                                        child: Text(
                                          banks.elementAt(index),
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.0,
                                            height: 18 / 14,
                                            letterSpacing: -0.17,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.ffd7dde8,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 1.w,
                                        color: AppColors.ff505d75,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  .then((value) => selectingBank.value = !selectingBank.value);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 44.w),
                Expanded(
                  child: Text(
                    selectedBank.value.toUpperCase(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 16.0,
                      height: 22.4 / 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ffd7dde8,
                    ),
                  ),
                ),
                SizedBox(
                  width: 44.w,
                  child: RotatedBox(
                    quarterTurns: selectingBank.value ? 1 : 3,
                    child: Image.asset(
                      AppAssets.icBack,
                      width: 10.w,
                      height: 13.5.w,
                    ),
                  ),
                ),
              ],
            ),
            gradient: selectingBank.value
                ? AppColors.greyGradientRevesre
                : AppColors.infiniteGreyGradient,
          ),
        ),
        SizedBox(height: 20.w),
        TextFormField(
          controller: accountHolderNameController,
          enabled: true,
          textInputAction: TextInputAction.next,
          style: GoogleFonts.montserrat(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            height: 18 / 14,
            color: AppColors.ffd7dde8,
          ),
          validator: (value) =>
              RequiredFieldValidator.validate(context, value!),
          decoration: getInputOutlineDecoration('Account Holder Name'),
        ),
        SizedBox(height: 20.w),
        TextFormField(
          controller: accountNumberController,
          enabled: true,
          textInputAction: TextInputAction.next,
          style: GoogleFonts.montserrat(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            height: 18 / 14,
            color: AppColors.ffd7dde8,
          ),
          validator: (value) =>
              RequiredFieldValidator.validate(context, value!),
          decoration: getInputOutlineDecoration('Account Number'),
        ),
        SizedBox(height: 5.w),
        Text(
          'Please ensure bank account holder\nis LiveCom Member',
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            height: 18 / 12,
            color: AppColors.ff8290aa,
          ),
        ),
        SizedBox(height: 30.w),
        Row(
          children: [
            Spacer(),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Text(
                'UPDATE BANK ACCOUNT',
                style: GoogleFonts.montserrat(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  height: 16.8 / 12,
                  color: AppColors.ffd7dde8,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildActions(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          AppCheckBox(value: isAgreed),
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
              if (amount > 1500) {
                errorMessage.value =
                    'You have exceeded your daily withdrawal limit. Please try again tomorrow.';
                isLimited.value = true;
              } else {
                if (amount > 1200) {
                  errorMessage.value =
                      'Input withdrawal amount is higher than Unlocked LiveTokens.';
                } else {
                  if (amount <= 0) {
                    errorMessage.value = 'Invalid amount. Please check again.';
                  } else {
                    errorMessage.value = '';
                    succeededWithdraw.value = true;
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
              'WITHDRAW',
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
    ]);
  }
}
