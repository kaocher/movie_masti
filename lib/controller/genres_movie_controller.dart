import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/movie_model.dart';
import '../repository/movie_repository.dart';

class GenresMovieController extends GetxController {
  // Repository Instance
  final MovieRepository _movieRepository = MovieRepository();
  var genresMovie = <MovieModel>[].obs;
  late int genreID;
  int _page = 1;
  var isLoading = true.obs;
  final ScrollController scrollController = ScrollController();

  Future getGenresMovie() async {
    try {
      List<MovieModel> response =
          await _movieRepository.getMovieByGenre(genreID: genreID, page: _page);
      genresMovie.addAll(response);
      _page += 1;
      isLoading.value = false;
      update();
    } catch (e) {
      throw Exception(e);
    }
  }

  void onScroll() {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    if (currentScroll == maxScroll && isLoading.value == false) {
      getGenresMovie();
    }
  }

  void reset() {

    isLoading.value=true;
    _page = 1;
    genresMovie.value = [];
    update();
  }
}
