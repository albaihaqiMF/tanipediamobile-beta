part of 'get_detail_lahan_cubit.dart';

abstract class GetDetailLahanState extends Equatable {
  const GetDetailLahanState();

  @override
  List<Object> get props => [];
}

class GetDetailLahanInitial extends GetDetailLahanState {}

class GetDetailLahanLoaded extends GetDetailLahanState {
  final Lahan lahan;
  GetDetailLahanLoaded(this.lahan);
  @override
  List<Object> get props => [lahan];
}

class GetDetailLahanFailed extends GetDetailLahanState {
  final String message;
  GetDetailLahanFailed(this.message);

  @override
  List<Object> get props => [message];
}
