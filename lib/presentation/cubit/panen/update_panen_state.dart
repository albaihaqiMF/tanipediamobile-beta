part of 'update_panen_cubit.dart';

abstract class UpdatePanenState extends Equatable {
  const UpdatePanenState();

  @override
  List<Object> get props => [];
}

class UpdatePanenInitial extends UpdatePanenState {}

class UpdatePanenLoaded extends UpdatePanenState {
  final Panen panen;
  UpdatePanenLoaded(this.panen);
  @override
  List<Object> get props => [panen];
}

class UpdatePanenFailed extends UpdatePanenState {
  final String message;
  UpdatePanenFailed(this.message);

  @override
  List<Object> get props => [message];
}
