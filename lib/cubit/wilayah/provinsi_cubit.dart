import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'provinsi_state.dart';

class ProvinsiCubit extends Cubit<ProvinsiState> {
  ProvinsiCubit() : super(ProvinsiInitial());

  Future<void> getProvinsi() async {
    ApiReturnValue<List<Wilayah>> result = await WilayahServices.getProvinsi();
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