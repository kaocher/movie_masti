import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_masti/repository/movie_repository.dart';
import '../model/movie_model.dart';

class PopularMovieController extends GetxController {
  // Repository Instance
  final MovieRepository _movieRepository = MovieRepository();
  // Variables
  int _page = 1;
  var popularMovie = <MovieModel>[].obs;
  var isLoading = true.obs;
  final ScrollController scrollController = ScrollController();

  Future _getPopularMovies() async {
    try {
      List<MovieModel> response =
          await _movieRepository.getPopularMovies(_page);
      popularMovie.addAll(response);
      _page++;
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
      _getPopularMovies();
    }
  }

  @override
  void onInit() {
    _getPopularMovies();
    scrollController.addListener(_onScroll);
    super.onInit();
  }
}
