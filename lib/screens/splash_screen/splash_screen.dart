import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375.0, 667.0),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.whiteTextColor,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.imSplashBackground),
              ),
            ),
            child: Center(
                child: Image.asset(
              AppAssets.imAppLogoSplash,
              width: 249.33.w,
              height: 34.0.w,
            )),
          ),
        ),
      ),
    );
  }
}
