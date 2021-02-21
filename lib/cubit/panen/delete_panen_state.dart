part of 'delete_panen_cubit.dart';

abstract class DeletePanenState extends Equatable {
  const DeletePanenState();

  @override
  List<Object> get props => [];
}

class DeletePanenInitial extends DeletePanenState {}

class DeletePanenLoaded extends DeletePanenState {
  final Panen panen;
  DeletePanenLoaded(this.panen);

  @override
  List<Object> get props => [panen];
}

class DeletePanenFailed extends DeletePanenState {
  final String message;
  DeletePanenFailed(this.message);

  @override
  List<Object> get props => [message];
}
