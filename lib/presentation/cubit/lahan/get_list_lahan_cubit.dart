import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'get_list_lahan_state.dart';

class GetListLahanCubit extends Cubit<GetListLahanState> {
  GetListLahanCubit() : super(GetListLahanInitial());

  void toInitial() {
    emit(GetListLahanInitial());
  }

  Future<void> getListLahan(String apiToken) async {
    ApiReturnValue<List<Lahan>> result =
        await LahanServices.getlistLahan(apiToken);
    if (result.value != null) {
      emit(GetListLahanLoaded(result.value));
    } else {
      emit(GetListLahanFailed(result.message));
    }
  }

  Future<void> getListLahanFiltered(String apiToken, Map<String,String> queryFilter) async {
    ApiReturnValue<List<Lahan>> result =
    await LahanServices.getlistLahanFilter(apiToken, queryFilter);
    if (result.value != null) {
      emit(GetListLahanLoaded(result.value));
    } else {
      emit(GetListLahanFailed(result.message));
    }
  }

}
