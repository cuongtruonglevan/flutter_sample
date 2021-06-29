import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.75),
            blurRadius: 10,
          ),
        ],
      ),
      height: 75.0.w,
      child: BottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.whiteTextColor,
        unselectedItemColor: AppColors.whiteTextColor,
        selectedLabelStyle: GoogleFonts.montserrat(
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w400,
            height: 1.6,
            color: AppColors.whiteTextColor),
        unselectedLabelStyle: GoogleFonts.montserrat(
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w400,
            height: 1.6,
            color: AppColors.whiteTextColor),
        onTap: (index) {
          print(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.icHome,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.icLiveStream,
            ),
            label: 'Live Stream',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.icLiveStore,
            ),
            label: 'Live Store',
          ),
        ],
      ),
    );
  }
}
