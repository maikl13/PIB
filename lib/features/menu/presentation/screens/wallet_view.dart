import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/custom_title.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

import '../widgets/transaction_item.dart';
import '../widgets/wallet_card.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  _buildWalletViewBody() {
    return ListView(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 50.h),

      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WalletCard(
          totalBalance: '23333',
          date: '12-2-2222',
        ),
        SizedBox(height: 32.h),
        const CustomTitle(title: AppStrings.lastTransaction),
        SizedBox(height: 20.h),
        _buildListOfTransactions(),
      ],
    );
  }

  _buildListOfTransactions() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const TransactionItem(
            date: '12-2-2222',
            amount: '500',
            type: AppStrings.chargeTo,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.h);
        },
        itemCount: 5);
  }
  //walletInfo.transactions!.length

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.accept,
        actions: const [],
      ),
      body: _buildWalletViewBody(),
    );
  }
}
