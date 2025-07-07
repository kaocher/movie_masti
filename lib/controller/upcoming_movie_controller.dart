import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_masti/repository/movie_repository.dart';
import '../model/movie_model.dart';

class UpcomingMovieController extends GetxController {
  // Repository Instance
  final MovieRepository _movieRepository = MovieRepository();
 // Variables
   int _page = 1;
  var upcomingMovie = <MovieModel>[].obs;
  var isLoading = true.obs;
  final ScrollController scrollController = ScrollController();

  Future _getUpcomingMovies() async {
    try {
      List<MovieModel> response =
          await _movieRepository.getUpcomingMovies(_page);
      upcomingMovie.addAll(response);

      _page+=1;
      isLoading.value = false;
      update();

    } catch (e) {
      throw Exception(e);
    }
  }

  void _onScroll() {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    if (currentScroll == maxScroll && isLoading.value == false) {
      _getUpcomingMovies();
    }
  }

  @override
  void onInit() {
    _getUpcomingMovies();
    scrollController.addListener(_onScroll);
    super.onInit();
  }
}
