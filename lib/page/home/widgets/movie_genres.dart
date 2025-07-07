import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/genres_controller.dart';
import '../../../widgets/custom_list.dart';
import '../../../widgets/shimmer/genre_shimmer.dart';
import '../../all_movie/genres_movie_page.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GenresController());

    return SizedBox(
      width: double.infinity,
      height: 45,
      child: Obx(
        () => controller.isLoading.value
            ? const GenreShimmer()
            : CustomList(
                itemCount: controller.genres.length,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenresMoviePage(
                        genreID: controller.genres[index].id,
                        title: controller.genres[index].name,
                      ),
                    ),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xff36454F),
                    ),
                    child: Text(
                      controller.genres[index].name.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
