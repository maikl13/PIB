import 'package:bloc/bloc.dart';
import 'package:pip/features/pip/business_logic/cubit/pip_state.dart';
import 'package:pip/features/pip/data/models/skills_model.dart';
import 'package:pip/features/pip/data/repository/pip_repository.dart';

import '../../../../core/web_services/network_exceptions.dart';

class PipCubit extends Cubit<PipState> {
  PipCubit(this.pipRepsitory) : super(const PipState.idle());

  final PipRepsitory pipRepsitory;



  void getAllSkills() async {
    emit(const PipState.loading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await pipRepsitory.getAllSkills();
    result.when(
      success: (List<SkillModel> skills) {

        emit(PipState.success(skills));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(PipState.error(networkExceptions));
      },
    );
  }
}
