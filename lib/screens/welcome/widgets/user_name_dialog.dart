import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNameDialog extends StatelessWidget {
  const UserNameDialog({Key? key, required this.topPadding}) : super(key: key);

  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 42.w)
              .copyWith(top: (topPadding + 56.w)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(17.31.w, 14.55.w, 15.58.w, 22.32.w),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5.w)),
                child: Text(
                  'Username word length is a minimum of 4 and maximum of 20 characters. No spacing or repetitive characters are allowed.\n\nMember is advised to come up with a creative and proper Username to be displayed on LiveCom. Usernames with improper, vulgar, racist or obscene wordings will be banned from usage in LiveCom.',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                    height: 18 / 12.0,
                    color: AppColors.whiteTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
