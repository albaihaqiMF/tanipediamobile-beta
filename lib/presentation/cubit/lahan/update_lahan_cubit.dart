import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'update_lahan_state.dart';

class UpdateLahanCubit extends Cubit<UpdateLahanState> {
  UpdateLahanCubit() : super(UpdateLahanInitial());

  Future<void> updateLahan(
      String apiToken,
      String idLahan,
      String kategori,
      int luas,
      // String satuan,
      String usiaTanam,
      int idPetani,
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
        // satuan,
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
