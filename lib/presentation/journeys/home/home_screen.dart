// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc? movieCarouselBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstanse<MovieCarouselBloc>();
    movieCarouselBloc!.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: Placeholder(color: Colors.grey),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.4,
            child: Placeholder(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
