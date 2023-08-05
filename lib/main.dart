import 'package:chuck_norris/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/chuck_norris_cubit.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  chuckNorrisGetInit();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => chuckNorrisGetIt<ChuckNorrisCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent.withOpacity(.5),
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )),
        debugShowCheckedModeBanner: false,
        home: ChuckNorrisHomeScreen(),
      ),
    );
  }
}
