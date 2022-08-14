import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_cubit.dart';
import '/di/get_it.dart';

import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselCubit? movieCarouselCubit;
  MovieBackdropCubit? movieBackdropCubit;

  @override
  void initState() {
    super.initState();
    movieCarouselCubit = getItInstance<MovieCarouselCubit>();
    movieBackdropCubit = movieCarouselCubit!.movieBackdropCubit;
    // When the home screen initializes,
    // dispatch the only event for MovieCarouselBloc
    // This will make an API call and yield the MovieCarouselLoaded or MovieCarouselError state.
    movieCarouselCubit!.loadCarousel();
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselCubit!.close();
    movieBackdropCubit!.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarouselCubit>(
          create: (context) => movieCarouselCubit!,
        ),
        BlocProvider<MovieBackdropCubit>(
          create: (context) => movieBackdropCubit!,
        ),
      ],
      child: Scaffold(
        // to read the current state of MovieCarouselBloc
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          bloc: movieCarouselCubit,
          builder: (context, state) {
            // print(state);
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit
                    .expand, // allows the stack to take the availble space.
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: Placeholder(color: Colors.white),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
