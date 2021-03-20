import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';
import 'package:meta/meta.dart';

part 'create_panen_state.dart';

class CreatePanenCubit extends Cubit<CreatePanenState> {
  final PanenRepositoryContract repository;
  CreatePanenCubit({@required this.repository})
      : assert(repository != null), super(CreatePanenInitial());

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
    ApiReturnValue<Panen> result = await repository.createPanen(
        token:apiToken,
        idPetani:idProfile,
        // instansi,
        kategori:kategori,
        // varietas,
        totalPanen:totalPanen,
        // satuan,
        // usiaTanam,
        tglTanam:tglTanam,
        tglPanen:tglPanen,
        // idLahan,
        keterangan:keterangan);
    if (result.value != null) {
      emit(CreatePanenLoaded(result.value));
    } else {
      emit(CreatePanenFailed(result.message));
    }
  }
}
