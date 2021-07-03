import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/screens/auth/auth_bloc.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/widgets/app_circular_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final topPadding = (MediaQuery.of(context).padding.top + 18.0).w;
    return Container(
      padding: EdgeInsets.fromLTRB(10.0.w, topPadding, 10.0.w, 10.0.w),
      child: Stack(children: [
        AppCircularButton(
          onPressed: () {
            if (title == 'LiveWallet') {
              BlocProvider.of<AuthBloc>(context).add(LogOut());
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Container(
            width: 40.0.w,
            height: 40.0.w,
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.icBack,
              width: 10.0.w,
              height: 13.5.w,
            ),
          ),
        ),
        Container(
          height: 40.0.w,
          child: Center(
            child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                height: 28 / 20,
                color: AppColors.whiteTextColor,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
