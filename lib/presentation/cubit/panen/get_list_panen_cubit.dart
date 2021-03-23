import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';
part 'get_list_panen_state.dart';

class GetListPanenCubit extends Cubit<GetPanenState> {
  final PanenRepository repository;
  GetListPanenCubit({@required this.repository})
      : assert(repository != null),super(GetPanenInitial());

  void toInitial() {
    emit(GetPanenInitial());
  }

  Future<void> getListPanen(String apiToken) async {
    ApiReturnValue<List<Panen>> result =
        await repository.getlistPanen(token: apiToken);
    if (result.value != null) {
      emit(GetListPanenLoaded(result.value));
    } else {
      emit(GetListPanenFailed(result.message));
    }
  }

  Future<void> getListPanenFiltered(String apiToken, Map<String,String> queryFilter ) async {
    ApiReturnValue<List<Panen>> result =
    await repository.getlistPanenFilter(token:apiToken, queryFilter: queryFilter);
    if (result.value != null) {
      emit(GetListPanenLoaded(result.value));
    } else {
      emit(GetListPanenFailed(result.message));
    }
  }
}
