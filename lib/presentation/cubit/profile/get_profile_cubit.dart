import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';
import 'package:meta/meta.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;
  GetProfileCubit({@required this.repository})
      : assert(repository != null),
        super(GetProfileInitial());

  Future<void> getProfile(String apiToken, int idProfile) async {
    ApiReturnValue<Profile> result =
        await repository.getDataProfile(token: apiToken, idProfile: idProfile);
    if (result.value != null) {
      emit(GetProfileLoaded(result.value));
    } else {
      emit(GetProfileFailed(result.message));
    }
  }

  void toInitial() {
    emit(GetProfileInitial());
  }
}
