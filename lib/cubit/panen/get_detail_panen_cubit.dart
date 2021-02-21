import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'get_detail_panen_state.dart';

class GetDetailPanenCubit extends Cubit<GetDetailPanenState> {
  GetDetailPanenCubit() : super(GetDetailPanenInitial());

  Future<void> getDetailPanen(String idPanen) async {
    ApiReturnValue<Panen> result = await PanenServices.getDetailPanen(idPanen);
    if (result.value != null) {
      emit(GetDetailPanenLoaded(result.value));
    } else {
      emit(GetDetailPanenFailed(result.message));
    }
  }
}
