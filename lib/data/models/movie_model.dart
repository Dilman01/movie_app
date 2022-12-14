import 'package:movie_app/domain/entities/movie_entity.dart';

// To properly tie MovieModel and MovieEntity and execute Clean architecture,
// extend MovieModel with MovieEntity.
// This will help in separating the Domain and Data Layer.

class MovieModel extends MovieEntity {
  final bool? adult;
  final String backdropPath;
  final int id;
  final String title;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final String posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String releaseDate;
  final bool? video;
  final double voteAverage;
  final int? voteCount;

  MovieModel(
      {this.adult,
      required this.backdropPath,
      required this.id,
      required this.title,
      this.originalLanguage,
      this.originalTitle,
      required this.overview,
      required this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      required this.releaseDate,
      this.video,
      required this.voteAverage,
      this.voteCount})
      : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      genreIds: json['genre_ids'].cast<int>(),
      popularity: json['popularity']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      video: json['video'] ?? '',
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
