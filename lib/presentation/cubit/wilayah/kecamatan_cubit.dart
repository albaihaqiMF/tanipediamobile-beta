import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';
part 'kecamatan_state.dart';

class KecamatanCubit extends Cubit<KecamatanState> {
  final WilayahRepositoryContract repository;
  KecamatanCubit({@required this.repository}) : assert(repository != null), super(KecamatanInitial());

  Future<void> getKecamatan(String provinsi, String kabupaten,
      {String kecamatan}) async {
    ApiReturnValue<List<Wilayah>> result;
    if (kecamatan != null) {
      result = await repository.getKecamatan(provinsi: provinsi, kabupaten: kabupaten, kecamatan: kecamatan);
    } else {
      result = await repository.getKecamatan(provinsi: provinsi, kabupaten: kabupaten);
    }
    if (result.value != null) {
      emit(KecamatanLoaded(result.value));
    } else {
      emit(KecamatanFailed(result.message));
    }
  }

  void toInitial() {
    emit(KecamatanInitial());
  }
}
