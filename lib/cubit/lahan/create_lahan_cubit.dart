import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'create_lahan_state.dart';

class CreateLahanCubit extends Cubit<CreateLahanState> {
  CreateLahanCubit() : super(CreateLahanInitial());

  Future<void> createLahan(
      String kategori,
      int luas,
      int satuan,
      String usiaTanam,
      String idPetani,
      String instansi,
      String alamat,
      String desa,
      String kecamatan,
      String kabupaten,
      String provinsi,
      String latitude,
      String longitude) async {
    ApiReturnValue<Lahan> result = await LahanServices.createLahan(
        kategori,
        luas,
        satuan,
        usiaTanam,
        idPetani,
        instansi,
        alamat,
        desa,
        kecamatan,
        kabupaten,
        provinsi,
        latitude,
        longitude);
    if (result.value != null) {
      emit(CreateLahanLoaded(result.value));
    } else {
      emit(CreateLahanFailed(result.message));
    }
  }
}
