import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';
import 'package:pip/features/pip/data/models/skills_model.dart';
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



        const factory MenuState.userSkillsLoading() = UserSkillsLoading<T>;

  const factory MenuState.userSkillsSuccess(List<SkillModel> skills) =
      UserSkillsSuccess<T>;

  const factory MenuState.userSkillsError(NetworkExceptions networkExceptions) =
      UserSkillsError<T>;


  const factory MenuState.updateSkillLoading() = UpdateSkillLoading<T>;

  const factory MenuState.updateSkillSuccess(UpdateSkill data) =
      UpdateSkillSuccess<T>;

  const factory MenuState.updateSkillError(NetworkExceptions networkExceptions) =
      UpdateSkillError<T>;


  const factory MenuState.walletBlanceAddedLoading() =
      WalletBlanceAddedLoading<T>;

  const factory MenuState.walletBalanceAddedSuccedded(AddBalance data) =
      WalletBalanceAddedSuccedded<T>;

  const factory MenuState.walletBalanceAdddedError(
      NetworkExceptions networkExceptions) = WalletBalanceAdddedError<T>;
}