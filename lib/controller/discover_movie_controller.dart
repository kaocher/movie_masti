import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_masti/repository/movie_repository.dart';
import '../model/movie_model.dart';

class DiscoverMovieController extends GetxController {
  // Repository Instance
  final MovieRepository _movieRepository = MovieRepository();
  // Variables
  int _page = 1;
  var discoverMovie = <MovieModel>[].obs;
  var isLoading = true.obs;

  final ScrollController scrollController = ScrollController();

  Future _getDiscoverMovies() async {
    try {
      List<MovieModel> response =
          await _movieRepository.getDiscoverMovies(_page);
      discoverMovie.addAll(response);
      _page += 1;
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
      _getDiscoverMovies();
    }
  }

  @override
  void onInit() {
    _getDiscoverMovies();
    scrollController.addListener(_onScroll);
    super.onInit();
  }
}
