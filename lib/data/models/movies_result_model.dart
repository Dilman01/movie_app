import './movie_model.dart';

class MoviesResultModel {
  List<MovieModel>? movies;

  MoviesResultModel({
    this.movies,
  });

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    // page = json['page'];
    if (json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {
        movies!.add(MovieModel.fromJson(v));
      });
    }
    // totalPages = json['total_pages'];
    // totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['page'] = this.page;
    if (movies != null) {
      data['results'] = movies!.map((v) => v.toJson()).toList();
    }
    // data['total_pages'] = this.totalPages;
    // data['total_results'] = this.totalResults;
    return data;
  }
}
