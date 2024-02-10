import 'package:book_apps_mvvm/core/enums/view_state.dart';
import 'package:book_apps_mvvm/core/models/book_model.dart';
import 'package:book_apps_mvvm/core/services/book_api.dart';
import 'package:book_apps_mvvm/core/view_models/base_view_model.dart';
import 'package:book_apps_mvvm/locator.dart';

class BookViewModel extends BaseViewModel {
  final BookApi _bookApi = locator<BookApi>();

  ///for list
  List<BookModel> book = [];

  Future<void> bookApiViewModel() async {
    setViewState(ViewState.busy);
    final result = await _bookApi.bookapi();

    book.add(result);

    setViewState(ViewState.idle);
  }
}
