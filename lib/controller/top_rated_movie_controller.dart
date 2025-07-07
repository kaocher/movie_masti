import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_masti/repository/movie_repository.dart';
import '../model/movie_model.dart';

class TopRatedMovieController extends GetxController {
  // Repository Instance
  final MovieRepository _movieRepository = MovieRepository();
  // Variables
  int _page = 1;
  var topRatedMovie = <MovieModel>[].obs;
  var isLoading = true.obs;
  final ScrollController scrollController = ScrollController();

  Future _getTopRatedMovies() async {
    try {
      List<MovieModel> response =
          await _movieRepository.getTopRatedMovies(_page);
      topRatedMovie.addAll(response);
      _page+=1;
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value=false;
      throw Exception(e);

    }
  }

  void _onScroll() {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    if (currentScroll == maxScroll && isLoading.value == false) {
      _getTopRatedMovies();
    }
  }

  @override
  void onInit() {
    _getTopRatedMovies();
    scrollController.addListener(_onScroll);
    super.onInit();
  }
}
