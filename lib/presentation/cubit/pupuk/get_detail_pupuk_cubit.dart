import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tanipedia_mobile_app/data/repository/repositories.dart';

part 'get_detail_pupuk_state.dart';

class DetailPupukCubit extends Cubit<DetailPupukState> {
  final PupukRepository repository;
  DetailPupukCubit({@required this.repository}): assert(repository != null),super(DetailPupukInitial());

  Future<void> getDetailPupuk(String apiToken, String idPupuk) async {
    ApiReturnValue<Pupuk> result =
        await repository.getDetailPupuk(token:apiToken, idPupuk:idPupuk);
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
