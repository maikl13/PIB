import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/widgets/empty_screen.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../data/models/wallet_info.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';

import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/menu_cubit.dart';
import '../../business_logic/menu_state.dart';
import '../../data/models/add_balance.dart';
import '../widgets/transaction_item.dart';
import '../widgets/wallet_card.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  _buildBloc() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          walletInfoError: (NetworkExceptions networkExceptions) {
            Commons.showToast(
              message: NetworkExceptions.getErrorMessage(networkExceptions),
              color: ColorManager.red,
            );
          },
          walletBalanceAddedSuccedded: (AddBalance addBalance) {
                BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();

            Navigator.pop(context);
            Commons.showToast(
              message: 'تم اضافة رصيد بنجاح',
              color: ColorManager.green,
            );
            BlocProvider.of<MenuCubit>(context).getWalletInfo();
          },
          walletBalanceAdddedError: (NetworkExceptions networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              message: NetworkExceptions.getErrorMessage(networkExceptions),
              color: ColorManager.red,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          walletInfoSuccedded: (walletInfo) {
            return _buildWalletViewBody(walletInfo);
          },
          orElse: () {
            return const LoadingIndicator();
          },
        );
      },
    );
  }

  _buildWalletViewBody(WalletInfo walletInfo) {
    return ListView(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 50.h),

      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WalletCard(
          totalBalance: walletInfo.totalBalance.toString(),
          date: walletInfo.transactions!.isEmpty
              ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
              : walletInfo.transactions![0].time!,
        ),
        SizedBox(height: 32.h),
        const CustomTitle(title: AppStrings.lastTransaction),
        SizedBox(height: 20.h),
        _buildListOfTransactions(walletInfo),
      ],
    );
  }

  _buildListOfTransactions(WalletInfo walletInfo) {
    return walletInfo.transactions!.isEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: const EmptyScreen(),
          )
        : ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TransactionItem(
                date: walletInfo.transactions![index].time!,
                amount: walletInfo.transactions![index].amount.toString(),
                type: walletInfo.transactions![index].type!,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15.h);
            },
            itemCount: walletInfo.transactions!.length > 5
                ? 5
                : walletInfo.transactions!.length);
  }

  //walletInfo.transactions!.length
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MenuCubit>(context).getWalletInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.myWallet,
        actions: const [],
      ),
      body: _buildBloc(),
    );
  }
}
