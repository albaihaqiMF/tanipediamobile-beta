part of 'desa_cubit.dart';

abstract class DesaState extends Equatable {
  const DesaState();

  @override
  List<Object> get props => [];
}

class DesaInitial extends DesaState {}

class DesaLoaded extends DesaState {
  final List<Wilayah> wilayah;
  DesaLoaded(this.wilayah);

  @override
  List<Object> get props => [wilayah];
}

class DesaFailed extends DesaState {
  final String message;
  DesaFailed(this.message);
  @override
  List<Object> get props => [message];
}
