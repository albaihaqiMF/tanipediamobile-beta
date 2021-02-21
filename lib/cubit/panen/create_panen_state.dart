part of 'create_panen_cubit.dart';

abstract class CreatePanenState extends Equatable {
  const CreatePanenState();

  @override
  List<Object> get props => [];
}

class CreatePanenInitial extends CreatePanenState {}

class CreatePanenLoaded extends CreatePanenState {
  final Panen panen;
  CreatePanenLoaded(this.panen);
  @override
  List<Object> get props => [panen];
}

class CreatePanenFailed extends CreatePanenState {
  final String message;
  CreatePanenFailed(this.message);

  @override
  List<Object> get props => [message];
}
