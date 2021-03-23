import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';
part 'update_panen_state.dart';

class UpdatePanenCubit extends Cubit<UpdatePanenState> {
  final PanenRepository repository;
  UpdatePanenCubit({@required this.repository})
      : assert(repository != null),super(UpdatePanenInitial());
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
    ApiReturnValue<Panen> result = await repository.updatePanen(
      token:apiToken,
      idPanen:idPanen,
      idPetani:idProfile,
      kategori:kategori,
      totalPanen:totalPanen,
      // satuan,
      // usiaTanam,
      tglTanam:tglTanam,
      tglPanen:tglPanen,
      keterangan:keterangan,
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
