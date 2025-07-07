import 'package:get/get.dart';
import 'package:movie_masti/model/genres_model.dart';
import '../repository/movie_repository.dart';

class GenresController extends GetxController {
// Repository Instance
  final MovieRepository _movieRepository = MovieRepository();
  var genres = <GenresModel>[].obs;
  var isLoading = true.obs;

  Future _getGenres() async {
    try {
      List<GenresModel> response = await _movieRepository.getGenres();
      genres.addAll(response);
      isLoading.value = false;
      update();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    _getGenres();
    super.onInit();
  }
}
