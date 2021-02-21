import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'delete_panen_state.dart';

class DeletePanenCubit extends Cubit<DeletePanenState> {
  DeletePanenCubit() : super(DeletePanenInitial());

  Future<void> deleteLahan(String idPanen) async {
    ApiReturnValue<Panen> result = await PanenServices.deletePanen(idPanen);
    if (result.value != null) {
      emit(DeletePanenLoaded(result.value));
    } else {
      emit(DeletePanenFailed(result.message));
    }
  }
}
