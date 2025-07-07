import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/popular_movie_controller.dart';
import '../../../widgets/custom_list.dart';
import '../../../widgets/movie_card_vertical.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/shimmer/horizontal_shimmer.dart';
import '../../all_movie/all_movie_page.dart';
import '../../details/details_page.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Popular Movies';
    final controller = Get.put(PopularMovieController());
    return Column(
      children: [
        SectionHeader(
          text: title,
          onTap: () => Get.to(
            () => AllMoviePage(
              movie: controller.popularMovie,
              scrollController: controller.scrollController,
              title: title,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 310,
          child: Obx(
            () => controller.isLoading.value
                ? const HorizontalShimmer()
                : CustomList(
                    itemCount: controller.popularMovie.length,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      final data = controller.popularMovie[index];
                      return MovieCardVertical(
                        image: data.posterPath.toString(),
                        title: data.title.toString(),
                        overView: data.overview.toString(),
                        voteAvarage: double.parse(
                          controller.popularMovie[index].voteAverage.toString(),
                        ),
                        onTap: () => Get.to(
                          () => DetailsPage(movieID: data.id!.toInt()),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
