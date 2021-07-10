import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/required_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_top_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMemberScreen extends StatelessWidget {
  SearchMemberScreen({Key? key}) : super(key: key);

  final RxBool noUserFound = false.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ff252c39,
      body: Column(
        children: [
          AppTopBar(title: 'Search Member'),
          buildSearchField(context),
          SizedBox(height: 8.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.ff181e28,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Obx(
                () => Visibility(
                  visible: !noUserFound.value,
                  child: buildUserList(),
                  replacement: buildNoUserFound(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextFormField(
        controller: searchController,
        enabled: true,
        textInputAction: TextInputAction.done,
        style: GoogleFonts.montserrat(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          height: 18 / 14,
          color: AppColors.ffd7dde8,
        ),
        onFieldSubmitted: (text) {
          noUserFound.value = !'alexa'.contains(text.toLowerCase().trim());
        },
        validator: (value) => RequiredFieldValidator.validate(context, value!),
        decoration: getInputOutlineDecoration('Search username').copyWith(
          suffixIcon: Image.asset(
            AppAssets.icSearch,
            width: 16.w,
            height: 15.61.w,
          ),
        ),
      ),
    );
  }

  Widget buildNoUserFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.icNoUserFound,
            width: 74.w,
            height: 74.w,
          ),
          SizedBox(height: 19.w),
          Text(
            'NO USER FOUND',
            style: GoogleFonts.bebasNeue(
              fontSize: 30.0,
              fontWeight: FontWeight.w400,
              height: 28 / 30,
              color: AppColors.ff2e394e,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserList() {
    return Padding(
      padding: EdgeInsets.fromLTRB(11.w, 10.w, 11.w, 0.0),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10.w),
        itemCount: 10,
        itemBuilder: (context, index) => MemberItem(),
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  const MemberItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () => Navigator.of(context).pushNamed(Routes.transfer),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Row(
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  child: Image.asset(AppAssets.imAvatarSample),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Alexa',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    height: 18 / 14,
                    letterSpacing: -0.17,
                    color: AppColors.ffd7dde8,
                  ),
                ),
                Spacer(),
                RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    AppAssets.icBack,
                    width: 10.w,
                    height: 13.5.w,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5.w,
            color: AppColors.ff505d75,
          )
        ],
      ),
    );
  }
}
