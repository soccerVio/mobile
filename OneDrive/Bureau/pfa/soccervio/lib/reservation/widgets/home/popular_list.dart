import 'package:animate_do/animate_do.dart';
import 'package:soccervio/reservation/models/terrain.dart';
import 'package:soccervio/reservation/widgets/detail/section_title.dart';
import 'package:soccervio/reservation/widgets/home/popular_item.dart';
import 'package:flutter/material.dart';
import 'package:soccervio/reservation/models/terrain_api.dart';

class PopularList extends StatelessWidget {
  final List items;

  const PopularList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1100),
      child: Column(
        children: [
          const SectionTitle(title: 'Most Popular'),
          Container(
            height: 239,
            margin: const EdgeInsets.only(bottom: 25),
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];

                  return PopularItem(
                    imageUrl: item['imageUrl'],
                    name: item['name'],
                    price: item['price'],
                    rating: item['rating'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class PopularList extends StatefulWidget {
//   final List items;

//   const PopularList({
//     Key? key,
//     required this.items,
//   }) : super(key: key);

//   @override
//   State<PopularList> createState() => _PopularListState();
// }

// class _PopularListState extends State<PopularList> {
//   late List<Recipe> _recipes;
//   bool _isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     getRecipes();
//   }

//   Future<void> getRecipes() async {
//     _recipes = await RecipeApi.getRecipe();
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeInUp(
//       duration: const Duration(milliseconds: 1100),
//       child: Column(
//         children: [
//           const SectionTitle(title: 'Most Popular'),
//           Container(
//             height: 239,
//             margin: const EdgeInsets.only(bottom: 25),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 24),
//               child: _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: _recipes.length,
//                       itemBuilder: (context, index) {
//                         // var item = widget.items[index];

//                         return PopularItem(
//                           imageUrl: _recipes[index].images,
//                           name: _recipes[index].rating.toString(),
//                           price: _recipes[index].totalTime,
//                           rating: _recipes[index].rating.toString(),
//                         );
//                       },
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
