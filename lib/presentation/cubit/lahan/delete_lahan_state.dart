part of 'delete_lahan_cubit.dart';

abstract class DeleteLahanState extends Equatable {
  const DeleteLahanState();

  @override
  List<Object> get props => [];
}

class DeleteLahanInitial extends DeleteLahanState {}

class DeleteLahanLoaded extends DeleteLahanState {
  final Lahan lahan;
  DeleteLahanLoaded(this.lahan);
  @override
  List<Object> get props => [lahan];
}

class DeleteLahanFailed extends DeleteLahanState {
  final String message;
  DeleteLahanFailed(this.message);

  @override
  List<Object> get props => [message];
}
