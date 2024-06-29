import 'package:code_challenge/app/home/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_library/movie_library.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(MovieRepositoryImpl(MovieLibrary())),
      child: const HomeView(),
    );
  }
}
