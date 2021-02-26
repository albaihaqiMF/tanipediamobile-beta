import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'desa_state.dart';

class DesaCubit extends Cubit<DesaState> {
  DesaCubit() : super(DesaInitial());
  Future<void> getDesa(String provinsi, String kabupaten, String kecamatan,
      {String desa}) async {
    ApiReturnValue<List<Wilayah>> result;
    if (desa != null) {
      result = await WilayahServices.getDesa(provinsi, kabupaten, kecamatan,
          desa: desa);
    } else {
      result = await WilayahServices.getDesa(provinsi, kabupaten, kecamatan);
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
