import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';

part 'verify_user_state.dart';

class VerifyUserCubit extends Cubit<VerifyUserState> {
  final UserRepository repository;
  VerifyUserCubit({@required this.repository}): assert(repository != null), super(VerifyUserInitial());

  Future<void> verifyUser(String apiToken) async {
    ApiReturnValue<User> result = await repository.verifyUser(token: apiToken);
    if (result.value != null) {
      emit(VerifyUserLoaded(result.value));
    } else {
      emit(VerifyUserFailed(result.message));
    }
  }
}
