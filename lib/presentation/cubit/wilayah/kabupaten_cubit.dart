import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';
part 'kabupaten_state.dart';

class KabupatenCubit extends Cubit<KabupatenState> {
  final WilayahRepository repository;
  KabupatenCubit({@required this.repository}): assert(repository != null), super(KabupatenInitial());

  Future<void> getKabupaten(String provinsi, {String kabupaten}) async {
    ApiReturnValue<List<Wilayah>> result;
    if (provinsi != null) {
      result = await repository.getKabupaten(
          provinsi: provinsi, kabupaten: kabupaten);
    } else {
      result = await repository.getKabupaten(provinsi: provinsi);
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
