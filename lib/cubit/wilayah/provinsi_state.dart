part of 'provinsi_cubit.dart';

abstract class ProvinsiState extends Equatable {
  const ProvinsiState();

  @override
  List<Object> get props => [];
}

class ProvinsiInitial extends ProvinsiState {}

class ProvinsiLoaded extends ProvinsiState {
  final List<Wilayah> wilayah;
  ProvinsiLoaded(this.wilayah);

  @override
  List<Object> get props => [wilayah];
}

class ProvinsiFailed extends ProvinsiState {
  final String message;
  ProvinsiFailed(this.message);
  @override
  List<Object> get props => [message];
}
