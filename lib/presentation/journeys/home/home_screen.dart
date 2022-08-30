import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_cubit.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movie_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';
import '../../widgets/app_error_widget.dart';
import '/di/get_it.dart';

import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselCubit? movieCarouselCubit;
  MovieBackdropCubit? movieBackdropCubit;
  MovieTabbedCubit? movieTabbedCubit;

  @override
  void initState() {
    super.initState();
    movieCarouselCubit = getItInstance<MovieCarouselCubit>();
    movieBackdropCubit = movieCarouselCubit!.movieBackdropCubit;
    movieTabbedCubit = getItInstance<MovieTabbedCubit>();
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
    movieTabbedCubit?.close();
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
        BlocProvider<MovieTabbedCubit>(
          create: (context) => movieTabbedCubit!,
        ),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        // to read the current state of MovieCarouselBloc
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          // bloc: movieCarouselCubit,
          builder: (context, state) {
            print(state);
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
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  ),
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                onPressed: () => movieCarouselCubit!.loadCarousel(),
                errorType: state.errorType,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
