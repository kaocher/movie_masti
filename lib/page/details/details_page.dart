import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_masti/page/details/movie_trailer_page.dart';
import 'package:movie_masti/page/details/widgets/recommended_movies.dart';
import 'package:movie_masti/page/details/widgets/similar_movies.dart';
import 'package:movie_masti/widgets/custom_image.dart';
import 'package:movie_masti/widgets/custom_list.dart';
import 'package:movie_masti/widgets/shimmer/details_shimmer.dart';
import '../../repository/movie_repository.dart';
import '../../utils/constant/api_constant.dart';
import '../../widgets/section_header.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.movieID});
  final int movieID;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Map<String, dynamic>> trailersList = [];

  @override
  void initState() {
    movieDetails();
    super.initState();
  }

  Future movieDetails() async {
    var trailersResponse = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${widget.movieID}/videos?api_key=${ApiConstant.API_KEY}'));
    if (trailersResponse.statusCode == 200) {
      var trailersJson = jsonDecode(trailersResponse.body);
      for (var i = 0; i < trailersJson['results'].length; i++) {
        if (trailersJson['results'][i]['type'] == 'Trailer') {
          setState(() {
            trailersList.add({
              'key': trailersJson['results'][i]['key'],
            });
          });
        }
      }
    } else {
      throw 'Error occurred';
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(trailersList[0]['key'].toString());

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future:
                MovieRepository().getMovieDetailsByID(movieID: widget.movieID),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 450,
                            decoration: const BoxDecoration(
                              color: Colors.white10,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: CustomImage(
                              image: snapshot.data!.posterPath.toString(),
                              width: MediaQuery.sizeOf(context).width,
                              height: 450,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          snapshot.data!.posterPath != null
                              ? Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle),
                                  child: GestureDetector(
                                    onTap: () => Get.to(() => MovieTrailerPage(
                                        trailerYtId: trailersList[0]['key'])),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      size: 55,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          Positioned(
                            top: 4,
                            left: 4,
                            child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: IconButton(
                                  alignment: Alignment.center,
                                  onPressed: () => Get.back(),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      // Movie Poster

                      const SizedBox(height: 12),

                      // Genre
                      SizedBox(
                        height: 40,
                        child: CustomList(
                          itemCount: snapshot.data!.genres!.length,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: const BoxDecoration(
                              color: Color(0xff50727B),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data!.genres![index].name.toString(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Run-Time
                            Text(
                              'Run-Time: ${snapshot.data!.runtime} minute',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 4),

                            // Release date
                            Text(
                              'Release date: ${snapshot.data!.releaseDate}',
                              // '2 hour 30 minutes',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 4),

                            // Ratings
                            Text(
                              'Ratings: ⭐${snapshot.data!.voteAverage!.toStringAsFixed(1)}/10',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),

                            // Movie Title
                            Text(
                              snapshot.data!.title.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),

                            const SizedBox(height: 10),

                            // Cast

                            // Movie Story
                            Text(
                              snapshot.data!.overview.toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Similar Movies Section
                      const SectionHeader(
                        text: 'Similar',
                        isButtonVisible: false,
                      ),
                      const SizedBox(height: 10),
                      SimilarMovies(
                        movieID: snapshot.data!.id!,
                      ),
                      const SizedBox(height: 12),

                      // Recommended Movies section
                      const SectionHeader(
                        text: 'Recommended',
                        isButtonVisible: false,
                      ),
                      const SizedBox(height: 10),
                      RecommendedMovies(movieID: snapshot.data!.id!),
                    ],
                  ),
                );
              } else {
                return const DetailsShimmer();
              }
            }),
      ),
    );
  }
}
