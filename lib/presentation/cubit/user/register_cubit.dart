import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(String username, String password) async {
    ApiReturnValue<User> result = await UserServices.register(username, password);
    if (result.value != null) {
      emit(RegisterLoaded(result.value));
    } else {
      emit(RegisterFailed(result.message));
    }
  }
}
