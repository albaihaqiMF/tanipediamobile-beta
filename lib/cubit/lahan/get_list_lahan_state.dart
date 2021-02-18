part of 'get_list_lahan_cubit.dart';

abstract class GetListLahanState extends Equatable {
  const GetListLahanState();

  @override
  List<Object> get props => [];
}

class GetListLahanInitial extends GetListLahanState {}

class GetListLahanLoaded extends GetListLahanState {
  final List<Lahan> lahan;
  GetListLahanLoaded(this.lahan);
  // @override
  // List<Object> get props => [lahan];
}

class GetListLahanFailed extends GetListLahanState {
  final String message;
  GetListLahanFailed(this.message);

  @override
  List<Object> get props => [message];
}
