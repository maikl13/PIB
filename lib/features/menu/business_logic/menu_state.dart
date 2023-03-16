import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../data/models/add_balance.dart';
import '../data/models/wallet_info.dart';
part 'menu_state.freezed.dart';

@freezed
class MenuState<T> with _$MenuState<T> {
  const factory MenuState.idle() = Idle<T>;

  const factory MenuState.walletInfoLoading() = WalletInfoLoading<T>;

  const factory MenuState.walletInfoSuccedded(WalletInfo data) =
      WalletInfoSuccedded<T>;

  const factory MenuState.walletInfoError(NetworkExceptions networkExceptions) =
      WalletInfoError<T>;

  const factory MenuState.walletBlanceAddedLoading() =
      WalletBlanceAddedLoading<T>;

  const factory MenuState.walletBalanceAddedSuccedded(AddBalance data) =
      WalletBalanceAddedSuccedded<T>;

  const factory MenuState.walletBalanceAdddedError(
      NetworkExceptions networkExceptions) = WalletBalanceAdddedError<T>;
}
