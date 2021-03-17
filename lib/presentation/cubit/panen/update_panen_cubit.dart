import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'update_panen_state.dart';

class UpdatePanenCubit extends Cubit<UpdatePanenState> {
  UpdatePanenCubit() : super(UpdatePanenInitial());
  Future<void> updatePanen(
    String apiToken,
    int idPanen,
    int idProfile,
    String kategori,
    int totalPanen,
    // String satuan,
    // int usiaTanam,
    String tglTanam,
    String tglPanen,
    String keterangan,
    // int idLahan,
    // String instansi,
    // String varietas,
  ) async {
    ApiReturnValue<Panen> result = await PanenServices.updatePanen(
      apiToken,
      idPanen,
      idProfile,
      kategori,
      totalPanen,
      // satuan,
      // usiaTanam,
      tglTanam,
      tglPanen,
      keterangan,
      // idLahan,
      // instansi,
      // varietas,
    );
    if (result.value != null) {
      emit(UpdatePanenLoaded(result.value));
    } else {
      emit(UpdatePanenFailed(result.message));
    }
  }
}
