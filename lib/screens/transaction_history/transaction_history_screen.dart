import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/home/widgets/transaction_item.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_sample/shared/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key, required this.transList})
      : super(key: key);

  final List<Transaction> transList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          AppTopBar(title: 'Transaction History'),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(10.0.w, 8.0.w, 10.0.w, 10.0.w),
            decoration: BoxDecoration(
              color: AppColors.transHistoryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: _buildTransactionHistory(),
          )),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return ListView(
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
    );
  }
}
