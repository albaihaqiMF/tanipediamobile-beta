import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'update_panen_state.dart';

class UpdatePanenCubit extends Cubit<UpdatePanenState> {
  UpdatePanenCubit() : super(UpdatePanenInitial());
  Future<void> updatePanen(
    idPanen,
    idProfile,
    kategori,
    totalPanen,
    satuan,
    usiaTanam,
    tglTanam,
    tglPanen,
    keterangan,
    // idLahan,
    // instansi,
    // varietas,
  ) async {
    ApiReturnValue<Panen> result = await PanenServices.updatePanen(
      idPanen,
      idProfile,
      kategori,
      totalPanen,
      satuan,
      usiaTanam,
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
