import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';
part 'provinsi_state.dart';

class ProvinsiCubit extends Cubit<ProvinsiState> {
  final WilayahRepositoryContract repository;
  ProvinsiCubit({@required this.repository}) : assert(repository != null), super(ProvinsiInitial());

  Future<void> getProvinsi({String provinsi}) async {
    ApiReturnValue<List<Wilayah>> result;
    if (provinsi != null) {
      result = await repository.getProvinsi(provinsi: provinsi);
    } else {
      result = await repository.getProvinsi();
    }

    if (result.value != null) {
      emit(ProvinsiLoaded(result.value));
    } else {
      emit(ProvinsiFailed(result.message));
    }
  }

  void toInitial() {
    emit(ProvinsiInitial());
  }
}
