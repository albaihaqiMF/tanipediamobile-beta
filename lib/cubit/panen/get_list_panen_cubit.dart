import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'get_list_panen_state.dart';

class GetPanenCubit extends Cubit<GetPanenState> {
  GetPanenCubit() : super(GetPanenInitial());

  void toInitial() {
    emit(GetPanenInitial());
  }

  Future<void> getListPanen(String apiToken) async {
    ApiReturnValue<List<Panen>> result =
        await PanenServices.getlistPanen(apiToken);
    if (result.value != null) {
      emit(GetListPanenLoaded(result.value));
    } else {
      emit(GetListPanenFailed(result.message));
    }
  }

  Future<void> getListPanenFiltered(String apiToken, Map<String,String> queryFilter ) async {
    ApiReturnValue<List<Panen>> result =
    await PanenServices.getlistPanenFilter(apiToken, queryFilter);
    if (result.value != null) {
      emit(GetListPanenLoaded(result.value));
    } else {
      emit(GetListPanenFailed(result.message));
    }
  }
}
