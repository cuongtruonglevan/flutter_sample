import 'package:flutter/material.dart';
import 'package:flutter_sample/models/model.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/widgets/expandable_widget.dart';
import 'package:flutter_sample/shared/widgets/rotatable_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem(
      {Key? key,
      required this.trans,
      required this.expanded,
      required this.onPressed})
      : super(key: key);

  final Transaction trans;
  final RxBool expanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trans.name,
                          style: GoogleFonts.montserrat(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            height: 18 / 14,
                            letterSpacing: -0.17,
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                        Text(
                          '${DateFormat('yyyy MMM dd hh:mma').format(trans.time)}',
                          style: GoogleFonts.montserrat(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            height: 18 / 12,
                            letterSpacing: -0.17,
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.icToken,
                            width: 15.0.w,
                            height: 15.0.w,
                          ),
                          Spacer(),
                          Text(
                            '${trans.amount}',
                            style: GoogleFonts.montserrat(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              height: 22.4 / 16,
                              color: AppColors.whiteTextColor,
                            ),
                          ),
                          SizedBox(width: 17.0.w),
                          RotatableWidget(
                            rotate: expanded.value,
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Image.asset(
                                AppAssets.icBack,
                                width: 10.0.w,
                                height: 13.5.w,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            ExpandableWidget(
                expand: expanded.value,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getAdditionalInfo(trans.name)
                        .map((text) => Container(
                              child: Text(
                                '$text',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  height: 18 / 12,
                                  letterSpacing: -0.17,
                                  color: AppColors.whiteTextColor,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )),
            SizedBox(height: 15.0.w),
            Container(
              width: double.infinity,
              height: 0.5.w,
              color: AppColors.borderColor,
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getAdditionalInfo(String value) {
    List<String> tempList = [];
    switch (value) {
      case 'Reload':
        tempList = ['RM 299.90'];
        break;
      case 'Transfer In':
        tempList = ['From Member123'];
        break;
      case 'Transfer Out':
        tempList = ['To Member123'];
        break;
      case 'Withdraw':
        tempList = ['Bank ABC', 'Bank Account Number'];
        break;
      case 'Live Stream':
        tempList = [
          'Seller_Username',
          'Stream ID: 12345',
          'Invoice ID: 123456789',
          'Product_Name',
          'Game Mode',
          'Quantity',
        ];
        break;
      case 'Live Store':
        tempList = [
          'Invoice ID: 123456789',
          'Product_Name',
          'Game Mode',
          'Quantity'
        ];
        break;
      case 'Live Praise':
        tempList = ['Stream ID', 'Seller_Username'];
        break;
      default:
    }

    return tempList;
  }
}

class Transaction {
  Transaction(this.id, this.name, this.amount, this.time, this.selected);

  final String id;
  final String name;
  final int amount;
  final DateTime time;
  final RxBool selected;
}
