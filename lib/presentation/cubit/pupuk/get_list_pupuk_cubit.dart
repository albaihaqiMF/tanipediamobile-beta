import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'get_list_pupuk_state.dart';

class GetListPupukCubit extends Cubit<GetListPupukState> {
  GetListPupukCubit() : super(GetListPupukInitial());

  void toInitial() {
    emit(GetListPupukInitial());
  }

  Future<void> getListPupuk(String apiToken) async {
    ApiReturnValue<List<Pupuk>> result =
        await PupukServices.getlistPupuk(apiToken);
    if (result.value != null) {
      emit(GetListPupukLoaded(result.value));
    } else {
      emit(GetListPupukFailed(result.message));
    }
  }

  Future<void> getListPupukFiltered(String apiToken, Map<String,String> queryFilter ) async {
    ApiReturnValue<List<Pupuk>> result =
    await PupukServices.getlistPupukFilter(apiToken, queryFilter);
    if (result.value != null) {
      emit(GetListPupukLoaded(result.value));
    } else {
      emit(GetListPupukFailed(result.message));
    }
  }
}
