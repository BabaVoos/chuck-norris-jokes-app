part of 'chuck_norris_cubit.dart';

abstract class ChuckNorrisState {}

class ChuckNorrisInitial extends ChuckNorrisState {}

class GetJokeSuccessState extends ChuckNorrisState {
  final ChuckNorris chuckNorris;
  GetJokeSuccessState(this.chuckNorris);
}
