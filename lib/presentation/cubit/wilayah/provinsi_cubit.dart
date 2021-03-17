import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'provinsi_state.dart';

class ProvinsiCubit extends Cubit<ProvinsiState> {
  ProvinsiCubit() : super(ProvinsiInitial());

  Future<void> getProvinsi({String provinsi}) async {
    ApiReturnValue<List<Wilayah>> result;
    if (provinsi != null) {
      result = await WilayahServices.getProvinsi(provinsi: provinsi);
    } else {
      result = await WilayahServices.getProvinsi();
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
