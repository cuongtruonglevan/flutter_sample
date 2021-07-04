import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementItem extends StatelessWidget {
  const AnnouncementItem(
      {Key? key, required this.announcement, this.isOdd = false})
      : super(key: key);

  final Announcement announcement;
  final bool isOdd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 158.w,
          height: 85.w,
          margin: EdgeInsets.only(right: 10.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(announcement.image),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: Offset(1, 5),
              ),
            ],
          ),
        ),
        Container(
          width: 158.w,
          height: 85.w,
          child: Padding(
            padding: EdgeInsets.only(left: 13.34.w, top: 39.46.w),
            child: Text(
              announcement.name,
              style: GoogleFonts.bebasNeue(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                height: 0.9,
                color:
                    isOdd ? AppColors.whiteTextColor : AppColors.blackTextColor,
                letterSpacing: 1.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Announcement {
  String name, image;

  Announcement(this.name, this.image);
}
