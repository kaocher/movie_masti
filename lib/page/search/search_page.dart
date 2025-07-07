import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/discover_movie_controller.dart';
import '../../controller/search_controller.dart';
import '../../widgets/custom_list.dart';
import '../../widgets/movie_card_horizontal.dart';
import '../../widgets/shimmer/vertical_shimmer.dart';
import '../details/details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

TextEditingController sController = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  @override
  void dispose() {
    sController.clear();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final discoverController = Get.put(DiscoverMovieController());
    final searchController = Get.put(MovieSearchController());

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: TextField(
              controller: sController,
              onTapOutside: (event) {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
              onChanged: (value) {
                setState(() {
                  searchController.getSearchedMovies(value);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Type your movie name here...',
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 6, right: 6),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: sController.text == ''
                ? Obx(
                    () => discoverController.isLoading.value
                        ? const VerticalShimmer(itemCount: 6)
                        : CustomList(
                            itemCount:
                                discoverController.discoverMovie.length + 1,
                            scrollDirection: Axis.vertical,
                            isHorizontalList: false,
                            controller: discoverController.scrollController,
                            itemBuilder: (context, index) {
                              if (index <
                                  discoverController.discoverMovie.length) {
                                final data =
                                    discoverController.discoverMovie[index];

                                return MovieCardHorizontal(
                                  image: data.posterPath.toString(),
                                  title: data.title.toString(),
                                  overView: data.overview.toString(),
                                  voteAvarage: double.parse(
                                    data.voteAverage.toString(),
                                  ),
                                  onTap: () => Get.to(
                                    () =>
                                        DetailsPage(movieID: data.id!.toInt()),
                                  ),
                                );
                              } else {
                                return const VerticalShimmer(itemCount: 1);
                              }
                            },
                          ),
                  )
                : Obx(
                    () => searchController.isLoading.value
                        ? const VerticalShimmer(itemCount: 6)
                        : searchController.searchedMovie.isEmpty
                        ? const Center(
                            child: Text('Movie not found.Try another one.'),
                          )
                        : ListView.separated(
                            itemCount: searchController.searchedMovie.length,
                            scrollDirection: Axis.vertical,
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            physics: const BouncingScrollPhysics(),
                            //controller: controller.scrollController,
                            itemBuilder: (context, index) {
                              final data =
                                  searchController.searchedMovie[index];

                              return MovieCardHorizontal(
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

                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 8),
                          ),
                  ),
          ),
        ),
      ),
    );
  }
}
