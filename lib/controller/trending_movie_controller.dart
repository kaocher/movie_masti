import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_masti/repository/movie_repository.dart';
import '../model/movie_model.dart';

class TrendingMovieController extends GetxController {
  // Repository Instance
  final MovieRepository _movieRepository = MovieRepository();
  // Variables
  int _page = 1;
  var trendingMovie = <MovieModel>[].obs;
  var isLoading = true.obs;
  final ScrollController scrollController = ScrollController();

  Future _getTrendingMovies() async {
    try {
      List<MovieModel> response =
          await _movieRepository.getTrendingMovies(_page);
      trendingMovie.addAll(response);
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
      _getTrendingMovies();
    }
  }

  @override
  void onInit() {
    _getTrendingMovies();
    scrollController.addListener(_onScroll);
    super.onInit();
  }

}
