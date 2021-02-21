import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'create_panen_state.dart';

class CreatePanenCubit extends Cubit<CreatePanenState> {
  CreatePanenCubit() : super(CreatePanenInitial());

  Future<void> createPanen(
    String kategori,
    String instansi,
    String varietas,
    int totalPanen,
    int satuan,
    String tglTanam,
    String tglPanen,
    String idLahan,
    String keterangan,
  ) async {
    ApiReturnValue<Panen> result = await PanenServices.createPanen(
        kategori,
        instansi,
        varietas,
        totalPanen,
        satuan,
        tglTanam,
        tglPanen,
        idLahan,
        keterangan);
    if (result.value != null) {
      emit(CreatePanenLoaded(result.value));
    } else {
      emit(CreatePanenFailed(result.message));
    }
  }
}