import 'package:flutter/material.dart';

import '../../../repository/movie_repository.dart';
import '../../../widgets/custom_list.dart';
import '../../../widgets/movie_card_vertical.dart';
import '../../../widgets/shimmer/horizontal_shimmer.dart';
import '../../details/details_page.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({super.key, required this.movieID});
  final int movieID;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 310,
      child: FutureBuilder(
        future: MovieRepository().getRecommendedMovies(movieId: movieID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'There is no recommended movie.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            } else {
              return CustomList(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
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
                },
              );
            }
          } else {
            return const HorizontalShimmer();
          }
        },
      ),
    );
  }
}
