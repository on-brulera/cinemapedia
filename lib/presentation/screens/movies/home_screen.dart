import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _HomeView(),),
      bottomNavigationBar: CustomButtomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideShow(movies: slideShowMovies),
                  MovieHorizontalListview(
                    movies: nowPlayingMovies, 
                    title: 'En cines', subtitle: 'Enero 1', 
                    loadNextPage: (){ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();},
                  ),
                  MovieHorizontalListview(
                    movies: upComingMovies, 
                    title: 'Próximamente', subtitle: 'En este mes', 
                    loadNextPage: (){ref.read(upComingMoviesProvider.notifier).loadNextPage();},
                  ),
                  MovieHorizontalListview(
                    movies: popularMovies, 
                    title: 'Populares', 
                    loadNextPage: (){ref.read(popularMoviesProvider.notifier).loadNextPage();},
                  ),
                  MovieHorizontalListview(
                    movies: topRatedMovies, 
                    title: 'Mejor Calificadas', subtitle: 'De Siempre',
                    loadNextPage: (){ref.read(topRatedMoviesProvider.notifier).loadNextPage();},
                  ),
                ],
              );
            },
            childCount: 1
          )
        )
      ]
    );
  }
}
