import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_sample/shared/widgets/app_toggle_button.dart';
import 'package:flutter_sample/shared/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReloadScreen extends StatefulWidget {
  ReloadScreen({Key? key}) : super(key: key);

  @override
  _ReloadScreenState createState() => _ReloadScreenState();
}

class _ReloadScreenState extends State<ReloadScreen> {
  final List<TokenPackage> tokenPackages = [
    TokenPackage(1, '500', 299.0, false.obs),
    TokenPackage(1, '300', 149.0, false.obs),
    TokenPackage(1, '100', 19.90, false.obs),
    TokenPackage(1, '10', 2.0, false.obs),
    TokenPackage(1, '25', 5.0, false.obs),
    TokenPackage(1, '150', 24.90, false.obs),
    TokenPackage(1, '700', 399.90, false.obs),
    TokenPackage(1, '1000', 549.90, false.obs),
  ];

  final RxBool fpxSelected = false.obs;
  final RxBool mastercardSelected = false.obs;
  final RxBool up = false.obs;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      up.value = scrollController.position.userScrollDirection ==
          ScrollDirection.reverse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          AppTopBar(title: 'Reload'),
          _buildPackages(),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 17.w, 20.w, 44.w),
              decoration: BoxDecoration(
                color: AppColors.darkBackGroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Expanded(child: _buildPaymentMethod()),
                  _buildAction(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackages() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Reload Package',
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              height: 18 / 16,
              letterSpacing: -0.17,
              color: AppColors.whiteTextColor,
            ),
          ),
          SizedBox(height: 20.w),
          SizedBox(
            height: 172.w,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              controller: scrollController,
              itemCount: tokenPackages.length,
              separatorBuilder: (context, index) => SizedBox(height: 20.w),
              itemBuilder: (context, index) {
                final e = tokenPackages.elementAt(index);
                return AppToggleButton(
                  gradient: AppColors.greyGradient,
                  reverseGradient: AppColors.greyGradientRevesre,
                  selected: e.selected,
                  onPressed: () {
                    if (!e.selected.value) {
                      tokenPackages.forEach((e) {
                        e.selected.value = false;
                      });
                    }
                    e.selected.value = !e.selected.value;
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4.5.w),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: Text(
                                  '${e.value}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 30.0,
                                    height: 1.15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whiteTextColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0.0,
                                top: 0.0,
                                child: Image.asset(
                                  AppAssets.icToken,
                                  width: 12.w,
                                  height: 12.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'RM${e.price.toStringAsFixed(2)}',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            height: 22.4 / 16,
                            letterSpacing: -0.17,
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0.5.w),
            alignment: Alignment.center,
            child: Obx(
              () => Icon(
                up.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppColors.greyColor,
                size: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Payment Method',
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            height: 18 / 16,
            letterSpacing: -0.17,
            color: AppColors.whiteTextColor,
          ),
        ),
        SizedBox(height: 20.w),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              AppToggleButton(
                gradient: AppColors.greyGradient,
                reverseGradient: AppColors.greyGradientRevesre,
                selected: mastercardSelected,
                onPressed: () {
                  fpxSelected.value = false;
                  mastercardSelected.value = !mastercardSelected.value;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icMasterCard,
                      width: 24.2.w,
                      height: 16.15.w,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '9190',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 22.4 / 16,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.w),
              AppToggleButton(
                gradient: AppColors.greyGradient,
                reverseGradient: AppColors.greyGradientRevesre,
                selected: fpxSelected,
                onPressed: () {
                  mastercardSelected.value = false;
                  fpxSelected.value = !fpxSelected.value;
                },
                child: Text(
                  'FPX',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    height: 22.4 / 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteTextColor,
                  ),
                ),
              ),
              SizedBox(height: 20.w),
              AppToggleButton(
                gradient: AppColors.greyGradient,
                reverseGradient: AppColors.greyGradientRevesre,
                selected: false.obs,
                onPressed: null,
                child: Text(
                  'E-WALLET (COMING SOON)',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    height: 22.4 / 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyTextColor,
                  ),
                ),
              ),
              SizedBox(height: 20.w),
              AppButton(
                onPressed: () {},
                gradient: AppColors.greyGradient,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40.w, 7.w, 40.w, 7.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icAdd,
                        width: 19.w,
                        height: 19.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'ADD PAYMENT CARD',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          height: 22.4 / 16,
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.w),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAction(BuildContext context) => Column(
        children: [
          Container(
            height: 0.5.w,
            color: AppColors.borderColor,
          ),
          SizedBox(height: 20.w),
          AppButton(
            onPressed: () {},
            gradient: AppColors.redGradient,
            child: Container(
              padding: EdgeInsets.fromLTRB(40.w, 10.w, 40.w, 10.w),
              width: MediaQuery.of(context).size.width - 42.w,
              alignment: Alignment.center,
              child: Text(
                'RELOAD',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  height: 22.4 / 16,
                  color: AppColors.whiteTextColor,
                ),
              ),
            ),
          ),
        ],
      );
}

class TokenPackage {
  TokenPackage(this.id, this.value, this.price, this.selected);
  final int id;
  final String value;
  final double price;
  final RxBool selected;
}
