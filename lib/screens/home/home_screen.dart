import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/home/widgets/announcement_item.dart';
import 'package:flutter_sample/screens/home/widgets/bottom_bar.dart';
import 'package:flutter_sample/screens/home/widgets/token_item.dart';
import 'package:flutter_sample/screens/home/widgets/token_popup.dart';
import 'package:flutter_sample/screens/home/widgets/transaction_item.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_sample/shared/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final availableTokensKey = GlobalKey();

  final List<Transaction> transList = [
    Transaction('7', 'Reload', 5000, DateTime.now(), false.obs),
    Transaction('6', 'Transfer Out', -700, DateTime.now(), false.obs),
    Transaction('5', 'Transfer In', 700, DateTime.now(), false.obs),
    Transaction('4', 'Withdraw', -700, DateTime.now(), false.obs),
    Transaction('3', 'Live Store', 500, DateTime.now(), false.obs),
    Transaction('2', 'Live Praise', 500, DateTime.now(), false.obs),
    Transaction('1', 'Live Stream', 500, DateTime.now(), false.obs),
  ];

  final List<Announcement> announcementsList = [
    Announcement('Announcement\nOne', AppAssets.imgAnnouncementOne),
    Announcement('Announcement\nTwo', AppAssets.imgAnnouncementTwo),
    Announcement('Announcement\nThree', AppAssets.imgAnnouncementOne),
    Announcement('Announcement\nFour', AppAssets.imgAnnouncementTwo),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    await Future.delayed(Duration(milliseconds: 1000));
    Navigator.of(context).pushNamed(Routes.welcome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: HomeBottomBar(),
      body: Column(
        children: [
          AppTopBar(title: 'LiveWallet'),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAvailableTokens(context),
                _buildAction(context),
                _buildActionsRow(),
                _buildTransactionHistory(context),
                _buildAnnouncements(),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildAvailableTokens(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.w),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    width: 15.w,
                    height: 15.w,
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
                  SizedBox(width: 5.w),
                  Icon(
                    Icons.help_outline,
                    size: 15.w,
                    color: AppColors.greyTextColor,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.w, 30.w, 40.w, 0.w),
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

  Widget _buildAction(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(21.w, 40.w, 21.w, 0.w),
        child: AppInfiniteButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.reload);
          },
          gradient: AppColors.redGradient,
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
      );

  Widget _buildActionsRow() => Padding(
        padding: EdgeInsets.fromLTRB(21.w, 20.w, 21.w, 30.w),
        child: Row(
          children: [
            Expanded(
              child: AppInfiniteButton(
                onPressed: () {},
                gradient: AppColors.infiniteGreyGradient,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icWithdraw,
                      width: 15.w,
                      height: 15.w,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'WITHDRAW',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 22.4 / 16,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: AppInfiniteButton(
                onPressed: () {},
                gradient: AppColors.infiniteGreyGradient,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icTransfer,
                      width: 16.w,
                      height: 16.w,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'TRANSFER',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 22.4 / 16,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildTransactionHistory(BuildContext context) {
    final tempList = transList.sublist(0, 5);
    return Container(
      padding: EdgeInsets.fromLTRB(10.w, 23.w, 10.w, 29.w),
      decoration: BoxDecoration(
        color: AppColors.darkBackGroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.transactionHistory,
                      arguments: transList);
                },
                child: Text(
                  'See All',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    height: 18 / 14,
                    color: AppColors.whiteTextColor,
                    letterSpacing: -0.17,
                  ),
                ),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: tempList
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
  }

  Widget _buildAnnouncements() => Container(
        margin: EdgeInsets.fromLTRB(0.0, 20.w, 0.0, 20.w),
        height: 95.w,
        alignment: Alignment.topLeft,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 11.w),
            children: announcementsList.map((announcement) {
              final isOdd = announcementsList.indexOf(announcement).isOdd;
              return AnnouncementItem(
                announcement: announcement,
                isOdd: isOdd,
              );
            }).toList()),
      );
}
