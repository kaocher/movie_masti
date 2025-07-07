import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/trending_movie_controller.dart';
import '../../../widgets/custom_list.dart';
import '../../../widgets/movie_card_vertical.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/shimmer/horizontal_shimmer.dart';
import '../../all_movie/all_movie_page.dart';
import '../../details/details_page.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Trending Movies';
    final controller = Get.put(TrendingMovieController());
    return Column(
      children: [
        SectionHeader(
          text: title,
          onTap: () => Get.to(() => AllMoviePage(
                movie: controller.trendingMovie,
                scrollController: controller.scrollController,
                title: title,
              )),
        ),
        SizedBox(
          width: double.infinity,
          height: 310,
          child: Obx(
            () => controller.isLoading.value
                ? const HorizontalShimmer()
                : CustomList(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemCount: controller.trendingMovie.length,
                    itemBuilder: (context, index) {
                      final data = controller.trendingMovie[index];
                      return MovieCardVertical(
                        image: data.posterPath.toString(),
                        title: data.title.toString(),
                        overView: data.overview.toString(),
                        voteAvarage: double.parse(data.voteAverage.toString()),
                        onTap: () => Get.to(
                          () => DetailsPage(
                            movieID: data.id!.toInt(),
                          ),
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
