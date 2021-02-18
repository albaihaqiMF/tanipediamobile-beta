part of 'get_detail_pupuk_cubit.dart';

abstract class DetailPupukState extends Equatable {
  const DetailPupukState();

  @override
  List<Object> get props => [];
}

class DetailPupukInitial extends DetailPupukState {}

class DetailPupukLoaded extends DetailPupukState {
  final Pupuk pupuk;
  DetailPupukLoaded(this.pupuk);
  @override
  List<Object> get props => [pupuk];
}

class DetailPupukFailed extends DetailPupukState {
  final String message;
  DetailPupukFailed(this.message);

  @override
  List<Object> get props => [message];
}
