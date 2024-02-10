import 'package:book_apps_mvvm/core/models/book_model.dart';
import 'package:book_apps_mvvm/core/view_models/book_view_model.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final coreUrl =
      'https://api.hidayahbooks.hidayahsmart.solutions/static/book_cover/';
  bool isFreeDetails = false;
  List<Free?> freeBook = [];
  List<String?> freeBookCategoriesList = [];
  bool isDisplayFreeGenre = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<BookViewModel>(
      onModelReady: (model) => model.bookApiViewModel(),
      builder: (context, model, child) {
        freeBook = (model.book.isNotEmpty && model.book[0].output != null)
            ? model.book[0].output!
                .where((output) => output.free != null)
                .map((output) => output.free)
                .toList()
            : [];

        freeBookCategoriesList = (model.book.isNotEmpty &&
                model.book[0].output != null)
            ? model.book[0].output!
                .where((element) =>
                    element.free != null &&
                    element.free!.bookCategories != null)
                .map((e) => e.free!.bookCategories!)
                .toSet()

                ///---///A Set is a collection of unique elements, and converting the list to a Set automatically removes any duplicate entries.
                .toList()
            : [];

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Book Store ',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            // titleSpacing: 40,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications)),
            ],
          ),
          body: SizedBox(
            height: 450,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                String imageUrl =
                    '$coreUrl${freeBook[index]!.imageNameF ?? 'No image'}';
                return Column(
                  children: [
                    Image.network(
                      imageUrl,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const CircularProgressIndicator();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        // Display an error message or placeholder image
                        return const Text('Error loading image');
                      },
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 12,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
