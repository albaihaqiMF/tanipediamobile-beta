import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';
part 'get_detail_panen_state.dart';

class GetDetailPanenCubit extends Cubit<GetDetailPanenState> {
  final PanenRepository repository;
  GetDetailPanenCubit({@required this.repository})
      : assert(repository != null),super(GetDetailPanenInitial());

  Future<void> getDetailPanen(String apiToken, String idPanen) async {
    ApiReturnValue<Panen> result =
        await repository.getDetailPanen(token:apiToken, idPanen: idPanen);
    if (result.value != null) {
      emit(GetDetailPanenLoaded(result.value));
    } else {
      emit(GetDetailPanenFailed(result.message));
    }
  }

  void toInitial() {
    emit(GetDetailPanenInitial());
  }
}
