import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/chuck_norris_model.dart';
import '../data/repositories/chuck_norris_repo.dart';

part 'chuck_norris_state.dart';

class ChuckNorrisCubit extends Cubit<ChuckNorrisState> {
  ChuckNorrisCubit(
    this.chuckNorrisRepo,
  ) : super(
          ChuckNorrisInitial(),
        );

  static ChuckNorrisCubit get(
    context,
  ) =>
      BlocProvider.of(
        context,
      );

  final ChuckNorrisRepo chuckNorrisRepo;

  void emitGetJoke() {
    chuckNorrisRepo.getJokes().then(
      (
        joke,
      ) {
        emit(
          GetJokeSuccessState(
            joke,
          ),
        );
      },
    );
  }
}
