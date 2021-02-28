import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'get_detail_lahan_state.dart';

class GetDetailLahanCubit extends Cubit<GetDetailLahanState> {
  GetDetailLahanCubit() : super(GetDetailLahanInitial());

  Future<void> getDetailLahan(String apiToken, String idLahan) async {
    ApiReturnValue<Lahan> result =
        await LahanServices.getDetailLahan(apiToken, idLahan);
    if (result.value != null) {
      emit(GetDetailLahanLoaded(result.value));
    } else {
      emit(GetDetailLahanFailed(result.message));
    }
  }

  void toInitial() {
    emit(GetDetailLahanInitial());
  }
}
