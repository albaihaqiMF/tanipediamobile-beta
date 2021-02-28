import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'get_list_pupuk_state.dart';

class GetListPupukCubit extends Cubit<GetListPupukState> {
  GetListPupukCubit() : super(GetListPupukInitial());

  Future<void> getListPupuk(String apiToken) async {
    ApiReturnValue<List<Pupuk>> result =
        await PupukServices.getlistPupuk(apiToken);
    if (result.value != null) {
      emit(GetListPupukLoaded(result.value));
    } else {
      emit(GetListPupukFailed(result.message));
    }
  }
}
