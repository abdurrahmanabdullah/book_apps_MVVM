import 'package:flutter/material.dart';

class FreeBook extends StatefulWidget {
  const FreeBook({super.key});

  @override
  State<FreeBook> createState() => _FreeBookState();
}

class _FreeBookState extends State<FreeBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('dfds')),
    );
  }
}

// import 'package:book_apps_mvvm/core/models/book_model.dart';
// import 'package:book_apps_mvvm/core/view_models/book_view_model.dart';
// import 'package:flutter/material.dart';
//
// import 'base_view.dart';
//
// class FreeBook extends StatefulWidget {
//   const FreeBook({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<FreeBook> createState() => _FreeBookState();
// }
//
// class _FreeBookState extends State<FreeBook> {
//   final coreUrl =
//       'https://api.hidayahbooks.hidayahsmart.solutions/static/book_cover/';
//   bool isFreeDetails = false;
//   List<Free?> freeBook = [];
//   List<String?> freeBookCategoriesList = [];
//   bool isDisplayFreeGenre = false;
//   @override
//   Widget build(BuildContext context) {
//     return BaseView<BookViewModel>(
//         onModelReady: (model) => model.bookApiViewModel(),
//         builder: (context, model, child) {
//           freeBook = (model.book.isNotEmpty && model.book[0].output != null)
//               ? model.book[0].output!
//                   .where((output) => output.free != null)
//                   .map((output) => output.free)
//                   .toList()
//               : [];
//
//           freeBookCategoriesList = (model.book.isNotEmpty &&
//                   model.book[0].output != null)
//               ? model.book[0].output!
//                   .where((element) =>
//                       element.free != null &&
//                       element.free!.bookCategories != null)
//                   .map((e) => e.free!.bookCategories!)
//                   .toSet()
//
//                   ///---///A Set is a collection of unique elements, and converting the list to a Set automatically removes any duplicate entries.
//                   .toList()
//               : [];
//           return const Scaffold(
//             body: Text('dfd'),
//           );
//           // return Column(
//           //   children: [
//           //     ///=====check if detailsBookFunction is called and isDisplayGenre is not true
//           //     if (isFreeDetails && isDisplayFreeGenre != true)
//           //       Row(
//           //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//           //         children: [
//           //           Column(
//           //             children: [
//           //               // if (displayImage.isNotEmpty)
//           //               Card(
//           //                 child: Column(
//           //                   children: [
//           //                     Image.network(
//           //                       freeDisplayImage,
//           //                       loadingBuilder:
//           //                           (context, child, loadingProgress) {
//           //                         if (loadingProgress == null) {
//           //                           return child;
//           //                         }
//           //                         return const CircularProgressIndicator();
//           //                       },
//           //                       errorBuilder: (context, error, stackTrace) {
//           //                         return const Text('Error loading image');
//           //                       },
//           //                       width: 200,
//           //                       height: 200,
//           //                     ),
//           //                     Text(
//           //                       'Price ${freeDisplayPrice.toString()}',
//           //                       style: const TextStyle(
//           //                           fontWeight: FontWeight.bold),
//           //                     ),
//           //                   ],
//           //                 ),
//           //               ),
//           //
//           //               const SizedBox(
//           //                 height: 15,
//           //               ),
//           //             ],
//           //           ),
//           //           Expanded(
//           //             child: Column(
//           //               crossAxisAlignment: CrossAxisAlignment.start,
//           //               children: [
//           //                 Text(
//           //                   freeDisplayName,
//           //                   style: const TextStyle(fontWeight: FontWeight.bold),
//           //                 ),
//           //                 const SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text('Author: $freeDisplayAuthor'),
//           //                 Text('Category: $freeCategory'),
//           //                 const Text(
//           //                   'Genre :',
//           //                   style: TextStyle(fontWeight: FontWeight.bold),
//           //                 ),
//           //                 Column(
//           //                   children: [
//           //                     Column(children: [
//           //                       for (int i = 0;
//           //                           i < freeBookCategoriesList.length;
//           //                           i++)
//           //                         InkWell(
//           //                           borderRadius: BorderRadius.circular(25),
//           //                           splashColor: Colors.blue,
//           //                           onTap: () {
//           //                             displayFree(i);
//           //                             // print(premiumBookCategoriesList[i]);
//           //                           },
//           //                           child: Container(
//           //                             margin: const EdgeInsets.all(8.0),
//           //                             padding: const EdgeInsets.symmetric(
//           //                                 vertical: 8, horizontal: 16),
//           //                             decoration: BoxDecoration(
//           //                               color: Colors.black12,
//           //                               borderRadius: BorderRadius.circular(8),
//           //                             ),
//           //                             child: Text(
//           //                               '${freeBookCategoriesList[i]}    ',
//           //                               style: const TextStyle(
//           //                                 fontWeight: FontWeight.bold,
//           //                               ),
//           //                             ),
//           //                           ),
//           //                         )
//           //                     ]),
//           //                   ],
//           //                 ),
//           //               ],
//           //             ),
//           //           ),
//           //         ],
//           //       )
//           //     else if (isDisplayFreeGenre == true)
//           //       Column(
//           //         children: [
//           //           Text(
//           //             '$genreBookType সম্পর্কিত আরো বই',
//           //             style: const TextStyle(
//           //                 fontWeight: FontWeight.bold, color: Colors.black),
//           //           ),
//           //           const Divider(),
//           //           const SizedBox(
//           //             height: 10,
//           //           ),
//           //
//           //           Image.network(
//           //             genreImage,
//           //             loadingBuilder: (context, child, loadingProgress) {
//           //               if (loadingProgress == null) {
//           //                 return child;
//           //               }
//           //               return const CircularProgressIndicator();
//           //             },
//           //             errorBuilder: (context, error, stackTrace) {
//           //               return const Text('Error loading image');
//           //             },
//           //           ),
//           //           const SizedBox(
//           //             height: 10,
//           //           ),
//           //           Text(
//           //             ' Price $genrePrice',
//           //             style: const TextStyle(fontWeight: FontWeight.bold),
//           //           ),
//           //           Column(
//           //             children: [
//           //               Text(
//           //                 'Book Name: $names',
//           //                 style: const TextStyle(fontWeight: FontWeight.bold),
//           //               ),
//           //             ],
//           //           ),
//           //
//           //           //
//           //         ],
//           //       )
//           //   ],
//           // );
//         });
//   }
//
//   ///-----------  free details book
//   String freeDisplayName = '';
//   String freeDisplayImage = '';
//   double freeDisplayPrice = 0;
//   String freeName = '';
//   String freeDisplayAuthor = '';
//   String freeCategory = '';
//   List<String> allGenreImages = [];
//   void freeDetails(int index) {
//     setState(() {
//       freeDisplayImage = '$coreUrl${freeBook[index]?.imageNameF ?? 'No image'}';
//       freeDisplayPrice = freeBook[index]?.price ?? 0.0;
//       freeName = freeBook[index]?.authorName ?? 'Unknown';
//       freeDisplayName = freeBook[index]?.name ?? 'Unknown';
//       freeDisplayAuthor = freeBook[index]?.authorName ?? 'Unknown';
//       freeCategory = freeBook[index]?.bookCategories ?? 'Unknown';
//       isFreeDetails = true;
//     });
//   }
//
//   ///-----Display Genre
//
//   String genreImage = '';
//   double genrePrice = 0;
//   String genreBookType = '';
//   String namee = '';
//   List<String> genreImages = [];
//   List<int> genrePrices = [];
//   List<String> names = [];
//
//   void displayFree(int index) {
//     setState(() {
//       String? targetGenre = freeBookCategoriesList[index];
//       genreBookType = freeBookCategoriesList[index]!;
//       for (Free? book in freeBook) {
//         if (book?.bookCategories == targetGenre) {
//           genreImage = '$coreUrl${book?.imageNameF ?? 'No image'}';
//           genrePrice = book?.price ?? 0.0;
//           String bookType = targetGenre ?? '';
//           String name = book?.name ?? 'Unknown';
//
//           names.add(name);
//           print(names);
//         }
//       }
//
//       isDisplayFreeGenre = true;
//     });
//   }
// }
