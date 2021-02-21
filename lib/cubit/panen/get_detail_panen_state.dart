part of 'get_detail_panen_cubit.dart';

abstract class GetDetailPanenState extends Equatable {
  const GetDetailPanenState();

  @override
  List<Object> get props => [];
}

class GetDetailPanenInitial extends GetDetailPanenState {}

class GetDetailPanenLoaded extends GetDetailPanenState {
  final Panen panen;
  GetDetailPanenLoaded(this.panen);
  @override
  List<Object> get props => [panen];
}

class GetDetailPanenFailed extends GetDetailPanenState {
  final String message;
  GetDetailPanenFailed(this.message);

  @override
  List<Object> get props => [message];
}
