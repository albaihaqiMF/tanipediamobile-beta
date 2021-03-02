import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'create_panen_state.dart';

class CreatePanenCubit extends Cubit<CreatePanenState> {
  CreatePanenCubit() : super(CreatePanenInitial());

  Future<void> createPanen(
    String apiToken,
    int idProfile,
    // String instansi,
    String kategori,
    // String varietas,
    int totalPanen,
    // int satuan,
    // int usiaTanam,
    String tglTanam,
    String tglPanen,
    // String idLahan,
    String keterangan,
  ) async {
    ApiReturnValue<Panen> result = await PanenServices.createPanen(
        apiToken,
        idProfile,
        // instansi,
        kategori,
        // varietas,
        totalPanen,
        // satuan,
        // usiaTanam,
        tglTanam,
        tglPanen,
        // idLahan,
        keterangan);
    if (result.value != null) {
      emit(CreatePanenLoaded(result.value));
    } else {
      emit(CreatePanenFailed(result.message));
    }
  }
}
