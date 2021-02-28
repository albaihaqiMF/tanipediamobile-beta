import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'delete_lahan_state.dart';

class DeleteLahanCubit extends Cubit<DeleteLahanState> {
  DeleteLahanCubit() : super(DeleteLahanInitial());

  Future<void> deleteLahan(String apiToken, String idLahan) async {
    ApiReturnValue<Lahan> result =
        await LahanServices.deleteLahan(apiToken, idLahan);
    if (result.value != null) {
      emit(DeleteLahanLoaded(result.value));
    } else {
      emit(DeleteLahanFailed(result.message));
    }
  }
}
