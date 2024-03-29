import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * MovieNotifier: Clase que controla
 * List<Movie>: Datos a ser manipulados, controlados
 */

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final upComingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpComing;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{
  
  bool isLouding = false;
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier(
    {required this.fetchMoreMovies}
  ): super([]);

  Future<void> loadNextPage()async{  
    if (isLouding)  return;
    isLouding = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(microseconds: 300));
    isLouding = false;
  }
}

