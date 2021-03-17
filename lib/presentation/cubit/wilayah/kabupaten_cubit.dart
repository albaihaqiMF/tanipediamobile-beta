import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'kabupaten_state.dart';

class KabupatenCubit extends Cubit<KabupatenState> {
  KabupatenCubit() : super(KabupatenInitial());
  Future<void> getKabupaten(String provinsi, {String kabupaten}) async {
    ApiReturnValue<List<Wilayah>> result;
    if (provinsi != null) {
      result =
          await WilayahServices.getKabupaten(provinsi, kabupaten: kabupaten);
    } else {
      result = await WilayahServices.getKabupaten(provinsi);
    }

    if (result.value != null) {
      emit(KabupatenLoaded(result.value));
    } else {
      emit(KabupatenFailed(result.message));
    }
  }

  void toInitial() {
    emit(KabupatenInitial());
  }
}
