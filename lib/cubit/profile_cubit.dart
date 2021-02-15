import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile(int idUser) async {
    ApiReturnValue<Profile> result = await ProfileServices.read(idUser);
    if (result.value != null) {
      emit(ProfileLoaded(result.value));
    } else {
      emit(ProfileLoadingFailed(result.message));
    }
  }
}