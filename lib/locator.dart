import 'package:book_apps_mvvm/core/view_models/book_view_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/book_api.dart';
import 'core/services/registration.dart';
import 'core/view_models/base_view_model.dart';
import 'core/view_models/registration_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => BaseViewModel());
  locator.registerFactory(() => BookViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerLazySingleton(() => BookApi());
  locator.registerLazySingleton(() => Registration());
}
