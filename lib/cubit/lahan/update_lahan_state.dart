part of 'update_lahan_cubit.dart';

abstract class UpdateLahanState extends Equatable {
  const UpdateLahanState();

  @override
  List<Object> get props => [];
}

class UpdateLahanInitial extends UpdateLahanState {}

class UpdateLahanLoaded extends UpdateLahanState {
  final Lahan lahan;
  UpdateLahanLoaded(this.lahan);
  @override
  List<Object> get props => [lahan];
}

class UpdateLahanFailed extends UpdateLahanState {
  final String message;
  UpdateLahanFailed(this.message);

  @override
  List<Object> get props => [message];
}
