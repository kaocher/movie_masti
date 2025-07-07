import 'package:flutter/material.dart';

import '../search/search_page.dart';
import 'widgets/movie_genres.dart';
import 'widgets/popular_movies.dart';
import 'widgets/top_rated_movies.dart';
import 'widgets/trending_movies.dart';
import 'widgets/upcoming_movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // titleTextStyle: Theme.of(context).textTheme.titleLarge,

          title: const Text('Movie World'),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage())),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: const SingleChildScrollView(

          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upcoming Movies Section
              UpcomingMovies(),
              SizedBox(height: 16),

              //Movie Genres
              MovieGenres(),
              SizedBox(height: 8),

              // Trending Movies Section

              TrendingMovies(),
              SizedBox(height: 12),

              // Top Rated Movies Section

              TopRatedMovies(),
              SizedBox(height: 12),

              // Popular Movies Section

              PopularMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
