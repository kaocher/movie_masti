import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/movie_model.dart';
import '../../widgets/movie_card_vertical.dart';
import '../../widgets/shimmer/horizontal_shimmer.dart';
import '../details/details_page.dart';

class AllMoviePage extends StatelessWidget {
  const AllMoviePage({
    super.key,
    required this.movie,
    required this.scrollController,
    required this.title,
  });

  final List<MovieModel> movie;
  final ScrollController scrollController;
  final String title;

  @override
  Widget build(BuildContext context) {
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
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GridView.builder(
                itemCount: movie.length +2,
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  if (index < movie.length) {
                    final data = movie[index];
                    return MovieCardVertical(
                      image: data.posterPath.toString(),
                      title: data.title.toString(),
                      overView: data.overview.toString(),
                      voteAvarage: double.parse(data.voteAverage.toString()),
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
