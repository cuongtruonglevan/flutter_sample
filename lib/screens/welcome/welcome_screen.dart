import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/screens/welcome/widgets/user_name_dialog.dart';
import 'package:flutter_sample/shared/app_assets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:flutter_sample/shared/validators/required_field_validator.dart';
import 'package:flutter_sample/shared/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey userNameKey = GlobalKey();
  final RxBool succeeded = false.obs;
  final TextEditingController userNameFieldController = TextEditingController();
  final TextEditingController firstNameFieldController =
      TextEditingController();
  final TextEditingController lastNameFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: Center(
          child: Obx(
            () => Visibility(
              visible: succeeded.value,
              child: _buildSucceededMessage(context),
              replacement: _buildInfoInput(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.w,
                  spreadRadius: 5.w,
                  offset: Offset(5.w, 5.w),
                  color: Colors.black.withOpacity(0.4),
                ),
                BoxShadow(
                  blurRadius: 20.w,
                  spreadRadius: 7.w,
                  offset: Offset(-7.w, -7.w),
                  color: AppColors.ff505d75.withOpacity(0.2),
                ),
              ],
              gradient: AppColors.lightGreyGradient,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(height: 25.w),
              Center(
                child: Text(
                  'Hello,\nwelcome aboard!',
                  style: GoogleFonts.montserrat(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                    color: AppColors.ffd7dde8,
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Text(
                'Let us know a little bit about you.',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  height: 20 / 16,
                  color: AppColors.ff7889a9,
                ),
              ),
              SizedBox(height: 31.w),
              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            key: userNameKey,
                            controller: userNameFieldController,
                            enabled: true,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              height: 18 / 14,
                              color: AppColors.ffd7dde8,
                            ),
                            validator: (value) =>
                                RequiredFieldValidator.validate(
                                    context, value!),
                            decoration: getInputOutlineDecoration('User Name')
                                .copyWith(errorMaxLines: 3),
                          ),
                          Positioned(
                            right: 10.w,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                final RenderBox renderBox = userNameKey
                                    .currentContext
                                    ?.findRenderObject() as RenderBox;
                                final offset =
                                    renderBox.localToGlobal(Offset.zero);
                                print(offset.dy);
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (context, _, __) =>
                                          UserNameDialog(topPadding: offset.dy),
                                      opaque: false),
                                );
                              },
                              icon: Icon(
                                Icons.help_outline,
                                size: 15.w,
                                color: AppColors.ff7889a9,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.w),
                      TextFormField(
                        controller: firstNameFieldController,
                        enabled: true,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          formKey.currentState!.validate();
                        },
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 18 / 14,
                          color: AppColors.ffd7dde8,
                        ),
                        validator: (value) =>
                            RequiredFieldValidator.validate(context, value!),
                        decoration: getInputOutlineDecoration('First Name'),
                      ),
                      SizedBox(height: 20.w),
                      TextFormField(
                        controller: lastNameFieldController,
                        enabled: true,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          formKey.currentState!.validate();
                        },
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 18 / 14,
                          color: AppColors.ffd7dde8,
                        ),
                        validator: (value) =>
                            RequiredFieldValidator.validate(context, value!),
                        decoration: getInputOutlineDecoration('Last Name'),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 50.w, 36.w, 26.w),
                    child: AppButton(
                      onPressed: () async {
                        // if (formKey.currentState!.validate())
                        succeeded.value = await Navigator.of(context)
                            .pushNamed(Routes.welcomeDetail) as bool;
                      },
                      gradient: AppColors.redGradient,
                      child: Text(
                        'NEXT',
                        style: GoogleFonts.montserrat(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          height: 19.6 / 14,
                          color: AppColors.ffd7dde8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildSucceededMessage(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 203),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 42.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 105.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.w,
                          spreadRadius: 5.w,
                          offset: Offset(5.w, 5.w),
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ],
                      gradient: AppColors.lightGreyGradient,
                    ),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        'HI USERNAME',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 44.0,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          color: AppColors.ffd7dde8,
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Text(
                        'Welcome to LiveCom. We\nhope you have a good time\nshopping here.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          height: 20 / 16,
                          color: AppColors.ffd7dde8,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 30.w, 0.w, 20.w),
                        child: AppButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          gradient: AppColors.redGradient,
                          child: Text(
                            'OK',
                            style: GoogleFonts.montserrat(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              height: 19.6 / 14,
                              color: AppColors.ffd7dde8,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.w,
                      spreadRadius: 5.w,
                      offset: Offset(5.w, 5.w),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    BoxShadow(
                      blurRadius: 20.w,
                      spreadRadius: 7.w,
                      offset: Offset(-7.w, -7.w),
                      color: AppColors.ff505d75.withOpacity(0.2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    127.w,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 127.w,
                      height: 127.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                        gradient: AppColors.lightGreyGradient,
                      ),
                      child: Center(
                        child: Image.asset(AppAssets.imWavingHand),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(flex: 245),
      ],
    );
  }
}
