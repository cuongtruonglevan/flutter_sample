import 'package:country_provider/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DialCodeDropdown extends StatefulWidget {
  final bool enabled;
  final List<String> countriesToShowCode;
  final ValueChanged<Country> onCountryChanged;

  const DialCodeDropdown(
      {Key? key,
      required this.enabled,
      required this.onCountryChanged,
      required this.countriesToShowCode})
      : super(key: key);

  @override
  _DialCodeDropdownState createState() => _DialCodeDropdownState();
}

class _DialCodeDropdownState extends State<DialCodeDropdown> {
  final RxList<Country> countries = <Country>[].obs;
  final Rx<Country> selectedCountry = Country().obs;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return countries.length > 0
          ? Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Country>(
                  value: selectedCountry.value,
                  items: _mapCountryToDropdownItem(countries),
                  onChanged: widget.enabled
                      ? (value) {
                          selectedCountry.value = value!;
                          widget.onCountryChanged(value);
                        }
                      : null,
                ),
              ),
            )
          : SizedBox();
    });
  }

  Future _init() async {
    try {
      final _temp = await CountryProvider.getCountriesByListOfCodes(
          widget.countriesToShowCode);
      selectedCountry.value = _temp.first;
      countries.addAll(_temp);
    } catch (e) {
      print(e.toString());
    }
  }

  List<DropdownMenuItem<Country>> _mapCountryToDropdownItem(
      List<Country> countries) {
    return countries
        .map((country) => DropdownMenuItem(
              child: _buildDropdownItem(country),
              value: country,
            ))
        .toList();
  }

  Widget _buildDropdownItem(Country country) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      height: 50.w,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.0.w),
                  child: SizedBox(
                    width: 12.w,
                    height: 8.67.w,
                    child: SvgPicture.network(
                      country.flag!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  '+ ${country.callingCodes!.first}',
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteTextColor),
                )
              ],
            ),
          ),
          Container(
            height: 1.w,
            color: AppColors.borderColor,
          ),
        ],
      ),
    );
  }
}
