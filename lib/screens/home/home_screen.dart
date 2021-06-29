import 'package:flutter/material.dart';
import 'package:flutter_sample/models/model.dart';
import 'package:flutter_sample/screens/home/widgets/announcement_item.dart';
import 'package:flutter_sample/screens/home/widgets/bottom_bar.dart';
import 'package:flutter_sample/screens/home/widgets/token_item.dart';
import 'package:flutter_sample/screens/home/widgets/token_popup.dart';
import 'package:flutter_sample/screens/home/widgets/transaction_item.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final availableTokensKey = GlobalKey();

  final List<Transaction> transList = [
    Transaction('7', 'Reload', 5000, DateTime.now(), false.obs),
    Transaction('6', 'Transfer Out', -700, DateTime.now(), false.obs),
    Transaction('5', 'Transfer In', 700, DateTime.now(), false.obs),
    Transaction('4', 'Withdraw', -700, DateTime.now(), false.obs),
    Transaction('3', 'Live Store', 500, DateTime.now(), false.obs),
    Transaction('2', 'Live Praise', 500, DateTime.now(), false.obs),
    Transaction(
        '1', 'Live Stream', 500, DateTime.now(), false.obs),
  ];

  final List<Announcement> announcementsList = [
    Announcement('Announcement\nOne', AppAssets.imgAnnouncementOne),
    Announcement('Announcement\nTwo', AppAssets.imgAnnouncementTwo),
    Announcement('Announcement\nThree', AppAssets.imgAnnouncementOne),
    Announcement('Announcement\nFour', AppAssets.imgAnnouncementTwo),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: HomeBottomBar(),
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAvailableTokens(context),
                _buildAction(),
                _buildActionsRow(),
                _buildTransactionHistory(),
                _buildAnnouncements(),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(20.0.w,
            (MediaQuery.of(context).padding.top + 18.0).w, 20.0.w, 20.0.w),
        child: Stack(children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                elevation: 10.0,
                shape: CircleBorder()),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.greyButtonColor,
                        AppColors.darkGreyButtonColor
                      ]),
                  borderRadius: BorderRadius.circular(100.0)),
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
          ),
          Container(
            height: 40.0.w,
            child: Center(
              child: Text(
                'LiveWallet',
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

  Widget _buildAvailableTokens(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.0.w),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Text(
                    '2000',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w400,
                      height: 1.1,
                      color: AppColors.whiteTextColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: Image.asset(
                    AppAssets.icToken,
                    width: 15.0.w,
                    height: 15.0.w,
                  ),
                ),
              ],
            ),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                final RenderBox renderBox = availableTokensKey.currentContext
                    ?.findRenderObject() as RenderBox;
                final offset = renderBox.localToGlobal(Offset.zero);
                print(offset.dy);
                Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (context, _, __) =>
                          TokenPopupDialog(topPadding: offset.dy),
                      opaque: false),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Available Tokens',
                    key: availableTokensKey,
                    style: GoogleFonts.montserrat(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                  SizedBox(width: 5.0.w),
                  Icon(
                    Icons.help_outline,
                    size: 15.0.w,
                    color: AppColors.greyTextColor,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0.w, 30.0.w, 40.0.w, 0.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TokenItem(label: 'Locked', amount: 600),
                  TokenItem(label: 'Unlocked', amount: 1200),
                  TokenItem(label: 'Free', amount: 200),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildAction() => Padding(
        padding: EdgeInsets.fromLTRB(21.0.w, 20.0.w, 21.0.w, 0.0.w),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0))),
          child: Ink(
            decoration: BoxDecoration(
                gradient: AppColors.redButtonGradient,
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(color: Colors.black)),
            child: Container(
              height: 44.0.w,
              alignment: Alignment.center,
              child: Text(
                'RELOAD LIVEWALLET',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  height: 22.4 / 16,
                  color: AppColors.whiteTextColor,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildActionsRow() => Padding(
        padding: EdgeInsets.fromLTRB(21.0.w, 20.0.w, 21.0.w, 30.0.w),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 10.0,
                    shadowColor: Colors.black.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0))),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: AppColors.greyButtonGradient,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icWithdraw,
                        width: 15.0.w,
                        height: 15.0.w,
                      ),
                      SizedBox(width: 5.0.w),
                      Container(
                        height: 44.0.w,
                        alignment: Alignment.center,
                        child: Text(
                          'WITHDRAW',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            height: 22.4 / 16,
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 10.0,
                    shadowColor: Colors.black.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0))),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: AppColors.greyButtonGradient,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icTransfer,
                        width: 16.0.w,
                        height: 16.0.w,
                      ),
                      SizedBox(width: 5.0.w),
                      Container(
                        height: 44.0.w,
                        alignment: Alignment.center,
                        child: Text(
                          'TRANSFER',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            height: 22.4 / 16,
                            color: AppColors.whiteTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildTransactionHistory() => Container(
        padding: EdgeInsets.fromLTRB(10.0.w, 23.0.w, 10.0.w, 29.0.w),
        decoration: BoxDecoration(
          color: AppColors.transHistoryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction History',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                height: 18 / 16,
                color: AppColors.whiteTextColor,
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: transList
                  .map((trans) => TransactionItem(
                        trans: trans,
                        expanded: trans.selected,
                        onPressed: () {
                          if (!trans.selected.value) {
                            transList.forEach((trans) {
                              trans.selected.value = false;
                            });
                          }
                          trans.selected.value = !trans.selected.value;
                        },
                      ))
                  .toList(),
            )
          ],
        ),
      );

  Widget _buildAnnouncements() => Container(
        margin: EdgeInsets.fromLTRB(0.0, 20.0.w, 0.0, 20.0.w),
        height: 95.0.w,
        alignment: Alignment.topLeft,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 11.0.w),
            children: announcementsList.map((announcement) {
              final isOdd = announcementsList.indexOf(announcement).isOdd;
              return AnnouncementItem(
                announcement: announcement,
                isOdd: isOdd,
              );
            }).toList()),
      );
}
