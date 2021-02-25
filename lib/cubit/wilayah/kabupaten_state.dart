part of 'kabupaten_cubit.dart';

abstract class KabupatenState extends Equatable {
  const KabupatenState();

  @override
  List<Object> get props => [];
}

class KabupatenInitial extends KabupatenState {}

class KabupatenLoaded extends KabupatenState {
  final List<Wilayah> wilayah;
  KabupatenLoaded(this.wilayah);

  @override
  List<Object> get props => [wilayah];
}

class KabupatenFailed extends KabupatenState {
  final String message;
  KabupatenFailed(this.message);
  @override
  List<Object> get props => [message];
}
