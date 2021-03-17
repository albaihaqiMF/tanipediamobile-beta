import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String username, String password) async {
    ApiReturnValue<User> result = await UserServices.login(username, password);

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
