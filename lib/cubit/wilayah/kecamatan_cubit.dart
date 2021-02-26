import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'kecamatan_state.dart';

class KecamatanCubit extends Cubit<KecamatanState> {
  KecamatanCubit() : super(KecamatanInitial());

  Future<void> getKecamatan(String provinsi, String kabupaten) async {
    ApiReturnValue<List<Wilayah>> result =
        await WilayahServices.getKecamatan(provinsi, kabupaten);
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