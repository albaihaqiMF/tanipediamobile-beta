import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());

  Future<void> updateUser(String apiToken, int idUser, String noTelp, {int idProfile}) async {
    ApiReturnValue<User> result = await UserServices.update(apiToken, idUser, noTelp, idProfile: idProfile);
    if (result.value != null) {
      emit(UpdateUserLoaded(result.value));
    } else {
      emit(UpdateUserFailed(result.message));
    }
  }
}
