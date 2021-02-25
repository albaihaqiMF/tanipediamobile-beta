import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'kabupaten_state.dart';

class KabupatenCubit extends Cubit<KabupatenState> {
  KabupatenCubit() : super(KabupatenInitial());
  Future<void> getKabupaten(String provinsi) async {
    ApiReturnValue<List<Wilayah>> result =
        await WilayahServices.getKabupaten(provinsi);
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
