import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/services/services.dart';

part 'get_list_lahan_state.dart';

class GetListLahanCubit extends Cubit<GetListLahanState> {
  GetListLahanCubit() : super(GetListLahanInitial());

  Future<void> getListLahan(String apiToken) async {
    ApiReturnValue<List<Lahan>> result =
        await LahanServices.getlistLahan(apiToken);
    if (result.value != null) {
      emit(GetListLahanLoaded(result.value));
    } else {
      emit(GetListLahanFailed(result.message));
    }
  }
}
