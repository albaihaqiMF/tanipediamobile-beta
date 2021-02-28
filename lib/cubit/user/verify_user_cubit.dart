import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'verify_user_state.dart';

class VerifyUserCubit extends Cubit<VerifyUserState> {
  VerifyUserCubit() : super(VerifyUserInitial());

  Future<void> verifyUser(String apiToken) async {
    ApiReturnValue<User> result = await UserServices.verifyUser(apiToken);
    if (result.value != null) {
      emit(VerifyUserLoaded(result.value));
    } else {
      emit(VerifyUserFailed(result.message));
    }
  }
}
