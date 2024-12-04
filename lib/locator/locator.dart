import 'package:get_it/get_it.dart';
import 'package:movie_roll/services/MovieApiService.dart';

import '../ViewModel/MovieViewModel.dart';


// instance of GetIt
final locator = GetIt.instance;

//set up dependency injection
void setupLocator() {
  //register api service as singleton
  locator.registerLazySingleton(() => MovieApiService());

  //register viewmodel w/ dependency injection on API service
  locator.registerFactory(() => MovieViewModel(locator<MovieApiService>()));
}
