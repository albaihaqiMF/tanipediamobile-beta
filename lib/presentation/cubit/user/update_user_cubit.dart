import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  final UserRepositoryContract repository;
  UpdateUserCubit({@required this.repository}): assert(repository != null), super(UpdateUserInitial());

  Future<void> updateUser(String apiToken, int idUser, String noTelp, {int idProfile}) async {
    ApiReturnValue<User> result = await repository.update(token:apiToken, idUser:idUser, noTelp:noTelp, idProfile: idProfile);
    if (result.value != null) {
      emit(UpdateUserLoaded(result.value));
    } else {
      emit(UpdateUserFailed(result.message));
    }
  }
}
