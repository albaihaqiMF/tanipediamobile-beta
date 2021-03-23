import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';

part 'delete_lahan_state.dart';

class DeleteLahanCubit extends Cubit<DeleteLahanState> {
  final LahanRepository repository;
  DeleteLahanCubit({@required this.repository})
      : assert(repository != null),super(DeleteLahanInitial());

  Future<void> deleteLahan(String apiToken, String idLahan) async {
    ApiReturnValue<Lahan> result =
        await repository.deleteLahan(apiToken, idLahan);
    if (result.value != null) {
      emit(DeleteLahanLoaded(result.value));
    } else {
      emit(DeleteLahanFailed(result.message));
    }
  }
}
