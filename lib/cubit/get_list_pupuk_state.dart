part of 'get_list_pupuk_cubit.dart';

abstract class GetListPupukState extends Equatable {
  const GetListPupukState();

  @override
  List<Object> get props => [];
}

class GetListPupukInitial extends GetListPupukState {}

class GetListPupukLoaded extends GetListPupukState {
  final List<Pupuk> pupuk;
  GetListPupukLoaded(this.pupuk);

  @override
  List<Object> get props => [pupuk];
}

class GetListPupukFailed extends GetListPupukState {
  final String message;
  GetListPupukFailed(this.message);
  @override
  List<Object> get props => [message];
}
