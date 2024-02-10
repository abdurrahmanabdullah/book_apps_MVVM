import 'package:book_apps_mvvm/core/view_models/book_view_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/book_api.dart';
import 'core/view_models/base_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => BaseViewModel());
  locator.registerFactory(() => BookViewModel());
  locator.registerLazySingleton(() => BookApi());
}
