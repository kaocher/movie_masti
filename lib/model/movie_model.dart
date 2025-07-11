
class MovieModel {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel(
      {this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ,
      backdropPath: json['backdrop_path'] ,
      id: json['id'],
      title: json['title'] ,
      originalLanguage: json['original_language'] ,
      originalTitle: json['original_title'],
      overview: json['overview'] ,
      posterPath: json['poster_path'] ,
      mediaType: json['media_type'],
      genreIds: json['genre_ids'].cast<int>() ,
      popularity: json['popularity'] ,
      releaseDate: json['release_date'] ,
      video: json['video'],
      voteAverage: json['vote_average'] ,
      voteCount: json['vote_count'] ,
    );
  }
}
