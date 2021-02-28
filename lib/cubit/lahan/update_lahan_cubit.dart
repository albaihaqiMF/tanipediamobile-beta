import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'update_lahan_state.dart';

class UpdateLahanCubit extends Cubit<UpdateLahanState> {
  UpdateLahanCubit() : super(UpdateLahanInitial());

  Future<void> updateLahan(
      String apiToken,
      String idLahan,
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
    ApiReturnValue<Lahan> result = await LahanServices.updateLahan(
        apiToken,
        idLahan,
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
      emit(UpdateLahanLoaded(result.value));
    } else {
      emit(UpdateLahanFailed(result.message));
    }
  }
}
