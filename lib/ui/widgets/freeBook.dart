import 'package:book_apps_mvvm/core/models/book_model.dart';
import 'package:book_apps_mvvm/core/view_models/book_view_model.dart';
import 'package:book_apps_mvvm/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class FreeBook extends StatelessWidget {
  FreeBook({super.key});
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
          //     body: SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       BuildC(),
          //       const SizedBox(
          //         width: 12,
          //       ),
          //       BuildC()
          //     ],
          //   ),
          // )
          body: Container(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) => BuildC(),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 12,
                );
              },
            ),
          ),
        );

        // children: [
        // Expanded(
        //   child: Image.network(
        //     imageUrl,
        //     loadingBuilder: (context, child, loadingProgress) {
        //       if (loadingProgress == null) {
        //         return child;
        //       }
        //       return const CircularProgressIndicator();
        //     },
        //     errorBuilder: (context, error, stackTrace) {
        //       // Display an error message or placeholder image
        //       return const Text('Error loading image');
        //     },
        //   ),
        // )
      },
    );
  }

  Widget BuildC() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
    );
  }
}
