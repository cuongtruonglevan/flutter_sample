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
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  child: Image.asset(
                    AppAssets.imSplashBackground,
                    fit: BoxFit.cover,
                    color: Color(0xFFC4C4C4),
                    colorBlendMode: BlendMode.colorBurn,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Center(
                  child: Image.asset(
                AppAssets.imAppLogoSplash,
                width: 249.33.w,
                height: 34.w,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
