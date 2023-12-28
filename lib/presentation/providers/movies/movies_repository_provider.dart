

import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//** provider solo de lectura y no va cambiar en la data

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(datasource: MovieDbDatasource());
});

