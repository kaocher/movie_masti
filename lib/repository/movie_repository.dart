import 'dart:convert';

import '../model/details_model.dart';
import '../model/genres_model.dart';
import '../model/movie_model.dart';
import 'package:http/http.dart' as http;

import '../utils/constant/api_constant.dart';

class MovieRepository {
  // Url
  String baseUrl = 'https://api.themoviedb.org/3';
  String apiKey = 'api_key=${ApiConstant.API_KEY}';

  final _latestUrl =
      'https://api.themoviedb.org/3/movie/latest?api_key=${ApiConstant.API_KEY}';
  final _searchUrl =
      'https://api.themoviedb.org/3/search/movie?query=puspa&api_key=22f5191920d6e1e648bcca61ee316df6';
  final _trailerUrl =
      'https://api.themoviedb.org/3/movie/id/videos?api_key=${ApiConstant.API_KEY}';

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  /// Trending Movies
  Future<List<MovieModel>> getTrendingMovies(int page) async {
    final trendingUrl =
        'https://api.themoviedb.org/3/trending/movie/day?page=$page&api_key=${ApiConstant.API_KEY}';
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return List<MovieModel>.from(
          data.map((movie) => MovieModel.fromJson(movie)));
    } else {
      throw Exception('Error Occurred');
    }
  }

  /// Top Rated Movies
  Future<List<MovieModel>> getTopRatedMovies(int page) async {
    final topRatedUrl =
        'https://api.themoviedb.org/3/movie/top_rated?page=$page&api_key=${ApiConstant.API_KEY}';
    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Error Occurred');
    }
  }

  /// Top Now Playing Movies
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'] as List;
        List<MovieModel> movieList =
            data.map((movie) => MovieModel.fromJson(movie)).toList();
        return movieList;
      } else {
        throw Exception('Error Occurred');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Upcoming Movies
  Future<List<MovieModel>> getUpcomingMovies(int page) async {
    final upComingUrl =
        'https://api.themoviedb.org/3/movie/upcoming?page=$page&api_key=${ApiConstant.API_KEY}';

    final response = await http.get(Uri.parse(upComingUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return List<MovieModel>.from(
          data.map((movie) => MovieModel.fromJson(movie)));
    } else {
      throw Exception('Error Occurred');
    }
  }

  /// Popular Movies
  Future<List<MovieModel>> getPopularMovies(int page) async {
    final popularUrl =
        'https://api.themoviedb.org/3/movie/popular?page=$page&api_key=${ApiConstant.API_KEY}';
    final response = await http.get(Uri.parse(popularUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return List<MovieModel>.from(
          data.map((movie) => MovieModel.fromJson(movie)));
    } else {
      throw Exception('Error Occurred');
    }
  }

  /// Latest Movies
  Future<List<MovieModel>> getLatestMovies() async {
    final response = await http.get(Uri.parse('')); //Todo
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Error Occurred');
    }
  }

  /// Recommended Movies
  Future<List<MovieModel>> getRecommendedMovies({required int movieId}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/recommendations?api_key=${ApiConstant.API_KEY}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'] as List;
        return data.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Error Occurred');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Similar Movies
  Future<List<MovieModel>> getSimilarMovies({required int movieId}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=${ApiConstant.API_KEY}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'] as List;
        return data.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Error Occurred');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Genre
  Future<List<GenresModel>> getGenres() async {
    const genresUrl =
        'https://api.themoviedb.org/3/genre/movie/list?api_key=${ApiConstant.API_KEY}';
    final response = await http.get(Uri.parse(genresUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['genres'] as List;

      return data.map((genre) => GenresModel.fromJson(genre)).toList();
    } else {
      throw Exception('Error Occurred');
    }
  }

  /// Get Movie by Genre
  Future<List<MovieModel>> getMovieByGenre(
      {required int genreID, required int page}) async {
    final url =
        '$baseUrl/discover/movie?with_genres=$genreID&page=$page&$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return List<MovieModel>.from(
          data.map((movie) => MovieModel.fromJson(movie)));
    } else {
      throw Exception('Error Occurred');
    }
  }

  /// Movie Details
  Future<MovieDetailsModel> getMovieDetailsByID({required int movieID}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieID?api_key=${ApiConstant.API_KEY}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return MovieDetailsModel.fromJson(data);
      } else {
        throw Exception('Error Occurred');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Search Movies
  Future<List<MovieModel>> getSearchMovies({required String query}) async {
    try {
      final url =
          'https://api.themoviedb.org/3/search/movie?query=$query&api_key=${ApiConstant.API_KEY}';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'] as List;
        return List<MovieModel>.from(
            data.map((movie) => MovieModel.fromJson(movie)));
      } else {
        throw Exception('Error Occurred');
      }
    } catch (e) {
      throw Exception('Another error occurred');
    }
  }

  /// Discover Movies
  Future<List<MovieModel>> getDiscoverMovies(int page) async {
    String disCoverUrl =
        'https://api.themoviedb.org/3/discover/movie?page=$page&api_key=${ApiConstant.API_KEY}';
    final response = await http.get(Uri.parse(disCoverUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return List<MovieModel>.from(
          data.map((movie) => MovieModel.fromJson(movie)));
    } else {
      throw Exception('Error Occurred');
    }
  }

  /// Get Trailer Key
  Future getTrailer(int movieID) async {
    List<Map<String, dynamic>> trailersList = [];
    var trailersResponse = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieID/videos?api_key=${ApiConstant.API_KEY}'));
    if (trailersResponse.statusCode == 200) {
      var trailersJson = jsonDecode(trailersResponse.body);
      for (var i = 0; i < trailersJson['results'].length; i++) {
        if (trailersJson['results'][i]['type'] == 'Trailer') {
          trailersList.add({
            'key': trailersJson['results'][i]['key'],
          });
        }
      }
    } else {
      throw 'Error occurred';
    }
    return trailersList[0]['key'];
  }
}
