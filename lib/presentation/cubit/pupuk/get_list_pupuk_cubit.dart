import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';

part 'get_list_pupuk_state.dart';

class GetListPupukCubit extends Cubit<GetListPupukState> {
  final PupukRepositoryContract repository;
  GetListPupukCubit({@required this.repository}): assert(repository != null),super(GetListPupukInitial());

  void toInitial() {
    emit(GetListPupukInitial());
  }

  Future<void> getListPupuk(String apiToken) async {
    ApiReturnValue<List<Pupuk>> result =
        await repository.getlistPupuk(token:apiToken);
    if (result.value != null) {
      emit(GetListPupukLoaded(result.value));
    } else {
      emit(GetListPupukFailed(result.message));
    }
  }

  Future<void> getListPupukFiltered(String apiToken, Map<String,String> queryFilter ) async {
    ApiReturnValue<List<Pupuk>> result =
    await repository.getlistPupukFilter(token:apiToken, queryFilter: queryFilter);
    if (result.value != null) {
      emit(GetListPupukLoaded(result.value));
    } else {
      emit(GetListPupukFailed(result.message));
    }
  }
}
