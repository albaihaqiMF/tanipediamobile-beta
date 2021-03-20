import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';
part 'desa_state.dart';

class DesaCubit extends Cubit<DesaState> {
  final WilayahRepositoryContract repository;
  DesaCubit({@required this.repository}) : assert(repository != null), super(DesaInitial());

  Future<void> getDesa(String provinsi, String kabupaten, String kecamatan, {String desa}) async {
    ApiReturnValue<List<Wilayah>> result;
    if (desa != null) {
      result = await repository.getDesa(provinsi: provinsi, kabupaten: kabupaten, kecamatan: kecamatan, desa: desa);
    } else {
      result = await repository.getDesa(provinsi: provinsi, kabupaten: kabupaten, kecamatan: kecamatan);
    }

    if (result.value != null) {
      emit(DesaLoaded(result.value));
    } else {
      emit(DesaFailed(result.message));
    }
  }

  void toInitial() {
    emit(DesaInitial());
  }
}
