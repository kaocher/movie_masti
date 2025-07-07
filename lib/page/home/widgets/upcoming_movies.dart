import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/upcoming_movie_controller.dart';
import '../../../widgets/movie_card_vertical.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/shimmer/horizontal_shimmer.dart';
import '../../all_movie/all_movie_page.dart';
import '../../details/details_page.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Upcoming Movies';
    final controller = Get.put(UpcomingMovieController());
    return Column(
      children: [
        SectionHeader(
          text: title,
          onTap: () => Get.to(
            () => AllMoviePage(
              movie: controller.upcomingMovie,
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
                : CarouselSlider.builder(
                    itemCount: controller.upcomingMovie.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                          final data = controller.upcomingMovie[index];
                          return MovieCardVertical(
                            image: data.posterPath.toString(),
                            title: data.title.toString(),
                            overView: data.overview.toString(),
                            voteAvarage: double.parse(
                              data.voteAverage.toString(),
                            ),
                            onTap: () => Get.to(
                              () => DetailsPage(movieID: data.id!.toInt()),
                            ),
                          );
                        },
                    options: CarouselOptions(
                      height: double.infinity,
                      viewportFraction: .47,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.33,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      autoPlayCurve: Curves.ease,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
