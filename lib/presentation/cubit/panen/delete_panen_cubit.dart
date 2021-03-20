import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories_contract.dart';
part 'delete_panen_state.dart';

class DeletePanenCubit extends Cubit<DeletePanenState> {
  final PanenRepositoryContract repository;
  DeletePanenCubit({@required this.repository})
      : assert(repository != null),super(DeletePanenInitial());

  Future<void> deletePanen(String apiToken, String idPanen) async {
    ApiReturnValue<Panen> result =
        await repository.deletePanen(token:apiToken, idPanen: idPanen);
    if (result.value != null) {
      emit(DeletePanenLoaded(result.value));
    } else {
      emit(DeletePanenFailed(result.message));
    }
  }
}
