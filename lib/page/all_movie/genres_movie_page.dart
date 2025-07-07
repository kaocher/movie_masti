import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/genres_movie_controller.dart';
import '../../widgets/custom_grid.dart';
import '../../widgets/movie_card_vertical.dart';
import '../../widgets/shimmer/gridview_shimmer.dart';
import '../../widgets/shimmer/horizontal_shimmer.dart';
import '../details/details_page.dart';

class GenresMoviePage extends StatelessWidget {
  const GenresMoviePage({
    super.key,
    required this.genreID,
    required this.title,
  });

  final int genreID;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GenresMovieController());
    controller.reset();
    controller.genreID = genreID;
    controller.getGenresMovie();
    controller.scrollController.addListener(controller.onScroll);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(child: GridViewShimmer())
                  : CustomGrid(
                      itemCount: controller.genresMovie.length + 2,
                      controller: controller.scrollController,
                      itemBuilder: (context, index) {
                        if (index < controller.genresMovie.length) {
                          final data = controller.genresMovie[index];
                          return MovieCardVertical(
                            image: data.posterPath.toString(),
                            title: data.title.toString(),
                            overView: data.overview.toString(),
                            voteAvarage:
                                double.parse(data.voteAverage.toString()),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  movieID: data.id!,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const HorizontalShimmer(itemCount: 1);
                        }
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
