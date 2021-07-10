import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: GetPlatform.isIOS ? 8.w : 0.0),
      decoration: BoxDecoration(
        color: AppColors.ff252c39,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.75),
            blurRadius: 10,
          ),
        ],
      ),
      height: GetPlatform.isIOS ? 91.w : kBottomNavigationBarHeight,
      child: BottomNavigationBar(
        backgroundColor: AppColors.ff252c39,
        selectedItemColor: AppColors.ffd7dde8,
        unselectedItemColor: AppColors.ffd7dde8,
        selectedLabelStyle: GoogleFonts.montserrat(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            height: 1.6,
            color: AppColors.ffd7dde8),
        unselectedLabelStyle: GoogleFonts.montserrat(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            height: 1.6,
            color: AppColors.ffd7dde8),
        onTap: (index) {},
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
