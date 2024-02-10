import 'dart:convert';

import 'package:book_apps_mvvm/core/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookApi {
  ///model should have .fromjson  formate ////BookModel.fromJson(Map<String, dynamic> json) {
  Future<BookModel> bookapi() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.hidayahbooks.hidayahsmart.solutions/v1/user/book/all/no'));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      BookModel bookmodel = BookModel.fromJson(responseData);
      return bookmodel;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
