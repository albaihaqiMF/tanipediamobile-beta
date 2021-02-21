part of 'create_lahan_cubit.dart';

abstract class CreateLahanState extends Equatable {
  const CreateLahanState();

  @override
  List<Object> get props => [];
}

class CreateLahanInitial extends CreateLahanState {}

class CreateLahanLoaded extends CreateLahanState {
  final Lahan lahan;
  CreateLahanLoaded(this.lahan);
  @override
  List<Object> get props => [lahan];
}

class CreateLahanFailed extends CreateLahanState {
  final String message;
  CreateLahanFailed(this.message);

  @override
  List<Object> get props => [message];
}
