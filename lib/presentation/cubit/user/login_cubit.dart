import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepositoryContract repository;
  LoginCubit({@required this.repository}): assert(repository != null), super(LoginInitial());

  Future<void> login(String username, String password) async {
    ApiReturnValue<User> result = await repository.login(username:username, password:password);

    if (result.value != null) {
      emit(LoginLoaded(result.value));
    } else {
      emit(LoginFailed(result.message));
    }
  }

  void toInitial(){
    emit(LoginInitial());
  }
}
