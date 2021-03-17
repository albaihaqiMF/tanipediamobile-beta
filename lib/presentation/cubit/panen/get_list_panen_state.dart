part of 'get_list_panen_cubit.dart';

abstract class GetPanenState extends Equatable {
  const GetPanenState();

  @override
  List<Object> get props => [];
}

class GetPanenInitial extends GetPanenState {}

class GetListPanenLoaded extends GetPanenState {
  final List<Panen> panen;
  GetListPanenLoaded(this.panen);
  @override
  List<Object> get props => [panen];
}

class GetListPanenFailed extends GetPanenState {
  final String message;
  GetListPanenFailed(this.message);

  @override
  List<Object> get props => [message];
}
