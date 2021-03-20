import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';

part 'get_detail_lahan_state.dart';

class GetDetailLahanCubit extends Cubit<GetDetailLahanState> {
  final LahanRepositoryContract repository;
  GetDetailLahanCubit({@required this.repository})
      : assert(repository != null),super(GetDetailLahanInitial());

  Future<void> getDetailLahan(String apiToken, String idLahan) async {
    ApiReturnValue<Lahan> result =
        await repository.getDetailLahan(apiToken, idLahan);
    if (result.value != null) {
      emit(GetDetailLahanLoaded(result.value));
    } else {
      emit(GetDetailLahanFailed(result.message));
    }
  }

  void toInitial() {
    emit(GetDetailLahanInitial());
  }
}
