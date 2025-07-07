import 'package:get/get.dart';
import '../model/movie_model.dart';
import '../repository/movie_repository.dart';

class MovieSearchController extends GetxController {
  // Repository Instance
  final MovieRepository _movieRepository = MovieRepository();

  var searchedMovie = <MovieModel>[].obs;
  var isLoading = false.obs;

  Future getSearchedMovies(String query) async {
    try {
      isLoading.value = true;
      searchedMovie.value = [];
      List<MovieModel> response =
          await _movieRepository.getSearchMovies(query: query);
      searchedMovie.addAll(response);
      isLoading.value = false;
      update();
    } catch (e) {
      throw Exception(e);
    }
  }
}
