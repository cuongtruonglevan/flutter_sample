import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PageRoute defaultPageRoute(BuildContext context, RouteSettings settings) =>
    platformPageRoute(
      context: context,
      settings: settings,
      builder: (context) => Container(),
    );

InputDecoration getInputOutlineDecoration(String label,
    {bool showHint = false, bool showLabel = true}) {
  final _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0.w)),
    borderSide: BorderSide(color: AppColors.whiteColor, width: 1.0),
  );

  final _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0.w)),
    borderSide: BorderSide(color: AppColors.backgroundColor, width: 1.0),
  );

  final _errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0.w)),
    borderSide: BorderSide(color: AppColors.redButtonColor, width: 1.0),
  );
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 27.0.w, vertical: 15.0.w),
    labelText: showLabel ? label.toString() : null,
    hintText: showHint ? label.toString() : null,
    labelStyle: GoogleFonts.montserrat(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      height: 18 / 14,
      color: AppColors.greyTextColor,
    ),
    hintStyle: GoogleFonts.montserrat(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      height: 18 / 14,
      color: AppColors.greyTextColor,
    ),
    fillColor: AppColors.textFieldFillColor,
    filled: true,
    enabledBorder: _defaultBorder,
    disabledBorder: _defaultBorder,
    focusedBorder: _focusedBorder,
    errorBorder: _errorBorder,
    focusedErrorBorder: _errorBorder,
  );
}
