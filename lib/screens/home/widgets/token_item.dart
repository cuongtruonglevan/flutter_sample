import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TokenItem extends StatelessWidget {
  const TokenItem({Key? key, required this.label, required this.amount})
      : super(key: key);

  final String label;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$label',
          style: GoogleFonts.montserrat(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            height: 1.0,
            color: AppColors.ff7889a9,
          ),
        ),
        SizedBox(height: 5.w),
        Text(
          '${amount.toString()}',
          style: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            height: 1.0,
            color: AppColors.ff7889a9,
          ),
        ),
      ],
    );
  }
}
