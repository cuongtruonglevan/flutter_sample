import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TokenPopupDialog extends StatelessWidget {
  const TokenPopupDialog({Key? key, required this.topPadding})
      : super(key: key);

  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0.w)
              .copyWith(top: (topPadding + 20.0).w),
          padding: EdgeInsets.fromLTRB(16.0.w, 12.0.w, 16.0.w, 18.0.w),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(5.0.w)),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Live',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w600,
                    height: 14.5 / 12.0,
                    color: AppColors.greyTextColor,
                  ),
                ),
                Text(
                  'Live The amount of LiveToken being\nreserved in any Game Mode',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                    height: 14.5 / 12.0,
                    color: AppColors.greyTextColor,
                  ),
                ),
                SizedBox(height: 10.0.w),
                Text(
                  'UNLOCKED',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w600,
                    height: 14.5 / 12.0,
                    color: AppColors.greyTextColor,
                  ),
                ),
                Text(
                  'The amount of LiveToken that is free to be used',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                    height: 14.5 / 12.0,
                    color: AppColors.greyTextColor,
                  ),
                ),
                SizedBox(height: 10.0.w),
                Text(
                  'FREE',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w600,
                    height: 14.5 / 12.0,
                    color: AppColors.greyTextColor,
                  ),
                ),
                Text(
                  'Complimentary LiveToken distributed by Sellers or Platform. Free LiveTokens cannot be withdrawn or transfered',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                    height: 14.5 / 12.0,
                    color: AppColors.greyTextColor,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
