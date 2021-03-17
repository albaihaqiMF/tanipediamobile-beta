import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services.dart';

part 'get_detail_pupuk_state.dart';

class DetailPupukCubit extends Cubit<DetailPupukState> {
  DetailPupukCubit() : super(DetailPupukInitial());

  Future<void> getDetailPupuk(String apiToken, String idPupuk) async {
    ApiReturnValue<Pupuk> result =
        await PupukServices.getDetailPupuk(apiToken, idPupuk);
    if (result.value != null) {
      emit(DetailPupukLoaded(result.value));
    } else {
      emit(DetailPupukFailed(result.message));
    }
  }

  void toInitial() {
    emit(DetailPupukInitial());
  }
}
