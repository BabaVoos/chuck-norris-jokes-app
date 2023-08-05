import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/strings.dart';
import '../../cubit/chuck_norris_cubit.dart';
import '../../data/models/chuck_norris_model.dart';
import '../widgets/meme_button.dart';
import '../widgets/meme_widget.dart';

class ChuckNorrisHomeScreen extends StatefulWidget {
  const ChuckNorrisHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChuckNorrisHomeScreen> createState() => _ChuckNorrisHomeScreenState();
}

class _ChuckNorrisHomeScreenState extends State<ChuckNorrisHomeScreen> {
  ChuckNorris chuckNorris = ChuckNorris();
  late Timer _timer;
  String image = ChuckAppStrings.images[0];

  void generatePicture() {
    var rng = Random();
    for (int i = 0; i < ChuckAppStrings.images.length; i++) {
      setState(
            () {
          image = ChuckAppStrings.images[rng.nextInt(
            6,
          )];
        },
      );
    }
  }

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(
        seconds: 5,
      ),
      (
        timer,
      ) {
        generatePicture();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            ChuckAppStrings.title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MemeButton(
                title: ChuckAppStrings.buttonTitle,
                onPressed: () {
                  BlocProvider.of<ChuckNorrisCubit>(
                    context,
                  ).emitGetJoke();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<ChuckNorrisCubit, ChuckNorrisState>(
                builder: (
                  context,
                  state,
                ) {
                  if (state is GetJokeSuccessState) {
                    chuckNorris = state.chuckNorris;
                    return MemeWidget(
                      meme: chuckNorris.value.toString(),
                    );
                  } else {
                    return const Center(
                      child: SizedBox(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
