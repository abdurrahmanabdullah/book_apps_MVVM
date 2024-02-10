import 'package:book_apps_mvvm/core/enums/view_state.dart';
import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setViewState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
