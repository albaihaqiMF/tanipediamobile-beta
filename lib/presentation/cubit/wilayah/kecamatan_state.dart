part of 'kecamatan_cubit.dart';

abstract class KecamatanState extends Equatable {
  const KecamatanState();

  @override
  List<Object> get props => [];
}

class KecamatanInitial extends KecamatanState {}

class KecamatanLoaded extends KecamatanState {
  final List<Wilayah> wilayah;
  KecamatanLoaded(this.wilayah);

  @override
  List<Object> get props => [wilayah];
}

class KecamatanFailed extends KecamatanState {
  final String message;
  KecamatanFailed(this.message);
  @override
  List<Object> get props => [message];
}
