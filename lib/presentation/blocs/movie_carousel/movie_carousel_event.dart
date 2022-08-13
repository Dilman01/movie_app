part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends MovieCarouselEvent {
  final int
      defaultIndex; // to decide which movie will be in the center of our carousel at the start

  const CarouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

// props method is used for comparison between two objects of the same type
  @override
  List<Object> get props => [defaultIndex];
}
