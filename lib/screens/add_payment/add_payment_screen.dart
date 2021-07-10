import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/required_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_sample/shared/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPaymentScreen extends StatelessWidget {
  AddPaymentScreen({Key? key}) : super(key: key);

  final GlobalKey selectBankKey = GlobalKey();
  final RxString selectedBank = 'SELECT BANK'.obs;
  final RxBool selectingBank = false.obs;
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  final List<String> banks = [
    'Agrobank',
    'AmBank (M) Berhad',
    'Alliance Bank Malaysia Berhad',
    'Affin Bank Berhad',
    'Other Bank'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ff252c39,
      body: Column(
        children: [
          AppTopBar(title: 'Add Payment Card'),
          Expanded(
            child: buildBody(context),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 44.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Details',
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
                final RenderBox renderBox = selectBankKey.currentContext
                    ?.findRenderObject() as RenderBox;
                final offset = renderBox.localToGlobal(Offset.zero);
                final height = ScreenUtil().screenHeight - offset.dy - 64.w;
                selectingBank.value = !selectingBank.value;
                showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) {
                          return Container(
                            height: height,
                            padding:
                                EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 44.w),
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
                                      selectedBank.value =
                                          banks.elementAt(index);
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
                    .then(
                        (value) => selectingBank.value = !selectingBank.value);
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
          SizedBox(height: 28.w),
          Obx(
            () => Visibility(
              visible: selectedBank.value == 'Other Bank',
              child: Column(
                children: [
                  TextFormField(
                    controller: bankNameController,
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
                    decoration: getInputOutlineDecoration('Bank Name'),
                  ),
                  SizedBox(height: 20.w),
                ],
              ),
              replacement: SizedBox(),
            ),
          ),
          TextFormField(
            controller: accountNameController,
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
            decoration: getInputOutlineDecoration('Card Holder Name'),
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
          SizedBox(height: 20.w),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: expiryDateController,
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
                  decoration: getInputOutlineDecoration('Expiry Date'),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: TextFormField(
                  controller: cvvController,
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
                  decoration: getInputOutlineDecoration('CVV'),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(height: 1.w, color: AppColors.ff505d75),
          SizedBox(height: 20.w),
          AppInfiniteButton(
            onPressed: () {
              Navigator.pop(context);
            },
            gradient: AppColors.redGradient,
            child: Container(
              padding: EdgeInsets.fromLTRB(40.w, 10.w, 40.w, 10.w),
              width: MediaQuery.of(context).size.width - 42.w,
              alignment: Alignment.center,
              child: Text(
                'ADD CARD',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  height: 22.4 / 16,
                  color: AppColors.ffd7dde8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
