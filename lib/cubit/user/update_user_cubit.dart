import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());

  Future<void> updateUser(String apiToken, String idUser, String idProfile, String noTelp) async {
    ApiReturnValue<User> result = await UserServices.update(apiToken, idUser, idProfile, noTelp);
    if (result.value != null) {
      emit(UpdateUserLoaded(result.value));
    } else {
      emit(UpdateUserFailed(result.message));
    }
  }
}
