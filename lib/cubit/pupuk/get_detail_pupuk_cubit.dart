import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'get_detail_pupuk_state.dart';

class DetailPupukCubit extends Cubit<DetailPupukState> {
  DetailPupukCubit() : super(DetailPupukInitial());

  Future<void> getDetailPupuk(String idPupuk) async {
    ApiReturnValue<Pupuk> result = await PupukServices.getDetailPupuk(idPupuk);
    if (result.value != null) {
      emit(DetailPupukLoaded(result.value));
    } else {
      emit(DetailPupukFailed(result.message));
    }
  }
}
