import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserRepositoryContract repository;
  RegisterCubit({@required this.repository}): assert(repository != null), super(RegisterInitial());

  Future<void> register(String username, String password) async {
    ApiReturnValue<User> result = await repository.register(username:username, password:password);
    if (result.value != null) {
      emit(RegisterLoaded(result.value));
    } else {
      emit(RegisterFailed(result.message));
    }
  }
}
