part of 'movie_tabbed_cubit.dart';

abstract class MovieTabbedState extends Equatable {
  final int? currentTabIndex; // will store the index of the tab selected

  const MovieTabbedState({this.currentTabIndex});

// using currentTabIndex in props so that the event doesn't dispatch when the same tab changes.
  @override
  List<Object> get props => [currentTabIndex!];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity>? movies;

  const MovieTabChanged({int? currentTabIndex, this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex!, movies!];
}

class MovieTabLoadError extends MovieTabbedState {
  // final AppErrorType errorType;

  const MovieTabLoadError({
    int? currentTabIndex,
    //   @required this.errorType,
  }) : super(currentTabIndex: currentTabIndex);
}

class MovieTabLoading extends MovieTabbedState {
  const MovieTabLoading({int? currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}
