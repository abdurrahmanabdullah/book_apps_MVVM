import 'package:book_apps_mvvm/core/models/book_model.dart';
import 'package:book_apps_mvvm/core/view_models/book_view_model.dart';
import 'package:book_apps_mvvm/ui/route_navigation.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final coreUrl =
      'https://api.hidayahbooks.hidayahsmart.solutions/static/book_cover/';

  //free book
  List<Free?> freeBook = [];
  List<String?> freeBookCategoriesList = [];
//premium book
  List<Premium?> premiumBook = [];
  List<String> premiumBookCategoriesList = [];

  ///
  bool isFreeDetails = false;
  bool isDisplayFreeGenre = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<BookViewModel>(
      onModelReady: (model) => model.bookApiViewModel(),
      builder: (context, model, child) {
        ///free list
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

        ///premium list
        premiumBook = (model.book.isNotEmpty && model.book[0].output != null)
            ? model.book[0].output!
                .where((output) => output.premium != null)
                .map((output) => output.premium)
                .toList()
            : [];

        premiumBookCategoriesList = (model.book.isNotEmpty &&
                model.book[0].output != null)
            ? model.book[0].output!
                .where((element) =>
                    element.premium != null &&
                    element.premium!.bookCategories != null)
                .map((e) => e.premium!.bookCategories!)
                .toSet()

                ///---///A Set is a collection of unique elements, and converting the list to a Set automatically removes any duplicate entries.
                .toList()
            : [];

        /// combine free+premium book list

        var allBook = <dynamic>[];
        allBook.addAll(freeBook);
        allBook.addAll(premiumBook);

// Create a list of strings containing image URL and name
        var allBookInfoList = allBook.map((book) {
          return '$coreUrl${book.imageNameF}';
          // return book.name;
          // return '$coreUrl${book.imageNameF ?? 'No image'} - ${book.name ?? 'Unknown'}';
        }).toList();

// Join the list into a single string
        var allBookInfo = allBookInfoList.join('\n');

// Print the combined information
        // print(allBookInfoList.length);

        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Book Store ',
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              leading:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              // titleSpacing: 40,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications)),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ///all book section
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        children: [
                          Text("Free Book",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber)),
                          Spacer(),
                          Text('All Book',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))
                        ],
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 256,

                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        scrollDirection: Axis.horizontal,
                        itemCount: freeBook.length,
                        itemBuilder: (context, index) {
                          String freeimageUrl =
                              '$coreUrl${freeBook[index]!.imageNameF ?? 'No image'}';
                          String name = freeBook[index]!.name ?? 'unknown';
                          return SizedBox(
                            width: 150,
                            // height: 150,
                            child: Column(
                              children: [
                                Expanded(
                                    child: AspectRatio(
                                  aspectRatio: 4 / 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteNavigation.freeBook);
                                      },
                                      child: Image.network(
                                        freeimageUrl,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const CircularProgressIndicator();
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          // Display an error message or placeholder image
                                          return const Text(
                                              'Error loading image');
                                        },
                                      ),
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('${getFirstThreeWord(name)}...')
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 7,
                          );
                        },
                      ),
                      // body: SizedBox(
                      //   height: 140,
                      //   child: ListView.separated(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: freeBook.length,
                      //     itemBuilder: (context, index) {
                      //       String imageUrl =
                      //           '$coreUrl${freeBook[index]!.imageNameF ?? 'No image'}';
                      //       String authorName = freeBook[index]!.name ?? 'unknown';
                      //
                      //       return Card(
                      //         child: AspectRatio(
                      //           aspectRatio: 2 / 3,
                      //           child: ClipRRect(
                      //             borderRadius: BorderRadius.circular(10),
                      //             child: Image.network(
                      //               imageUrl,
                      //               fit: BoxFit.cover,
                      //               width: 200,
                      //               loadingBuilder: (context, child, loadingProgress) {
                      //                 if (loadingProgress == null) {
                      //                   return child;
                      //                 }
                      //                 return const CircularProgressIndicator();
                      //               },
                      //               errorBuilder: (context, error, stackTrace) {
                      //                 // Display an error message or placeholder image
                      //                 return const Text('Error loading image');
                      //               },
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     separatorBuilder: (BuildContext context, int index) {
                      //       return const SizedBox(
                      //         width: 7,
                      //       );
                      //     },
                      //   ),
                      // ),
                    ),

                    ///premium section
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        children: [
                          Text("Premium  Book",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber)),
                          Spacer(),
                          Text('All Book',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))
                        ],
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 256,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        scrollDirection: Axis.horizontal,
                        itemCount: premiumBook.length,
                        itemBuilder: (context, index) {
                          String premiumImageUrl =
                              '$coreUrl${premiumBook[index]!.imageNameF ?? 'No image'}';
                          String name = premiumBook[index]!.name ?? 'unknown';
                          return SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                Expanded(
                                    child: AspectRatio(
                                  aspectRatio: 4 / 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      premiumImageUrl,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const CircularProgressIndicator();
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        // Display an error message or placeholder image
                                        return const Text(
                                            'Error loading image');
                                      },
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(getFirstThreeWord(name))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 7,
                          );
                        },
                      ),
                    ),

                    ///top rated book

                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        children: [
                          Text("Top Rated Book",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber)),
                        ],
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 256,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        scrollDirection: Axis.horizontal,
                        // itemCount: newList.length,

                        itemCount: allBookInfoList.length,
                        itemBuilder: (context, index) {
                          var book = allBook[index];
                          String imageUrl =
                              '$coreUrl${book.imageNameF ?? 'No image'}';

                          String ratedImageUrl = '';
                          for (var book in allBook) {
                            ratedImageUrl =
                                '$coreUrl${book.imageNameF ?? 'No image'}';

                            //  print(ratedImageUrl);
                          }
                          //    print(allBook[index].imageNameF);
                          //print(ratedImageUrl);

                          String name = premiumBook[index]!.name ?? 'unknown';
                          return SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                Expanded(
                                    child: AspectRatio(
                                  aspectRatio: 4 / 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      allBookInfoList[6],
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const CircularProgressIndicator();
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        // Display an error message or placeholder image
                                        return const Text(
                                            'Error loading image');
                                      },
                                    ),
                                  ),
                                )),

                                const SizedBox(
                                  height: 5,
                                ),

                                RatingBar.builder(
                                  initialRating: 4, // Initial rating value
                                  minRating: 1, // Minimum rating
                                  direction: Axis
                                      .horizontal, // Rating bar direction (horizontal or vertical)
                                  allowHalfRating:
                                      true, // Whether to allow half rating
                                  itemCount: 5, // Number of rating items
                                  itemSize: 20,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    );
                                  },
                                  onRatingUpdate: (index) {},
                                )
                                // Text(getFirstThreeWord(name))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 7,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
            bottomNavigationBar:
                CurvedNavigationBar(backgroundColor: Colors.amber, items: [
              const Icon(Icons.home),
              // Icon(Icons.favorite),
              const Icon(Icons.category),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNavigation.authentication);
                  },
                  child: const Icon(Icons.account_circle_rounded)),
            ]));
      },
    );
  }

  String getFirstThreeWord(String text) {
    List<String> words = text.split(' ');
    int numWordsToShow = 2;
    if (words.length > numWordsToShow) {
      return words.sublist(0, numWordsToShow).join(' ');
    } else {
      return text;
    }
  }
}
