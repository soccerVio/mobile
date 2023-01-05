import 'dart:ffi';
import 'package:soccervio/reservation/models/terrain_api.dart';
import 'package:animate_do/animate_do.dart';
import 'package:soccervio/reservation/models/terrain.dart';
import 'package:soccervio/reservation/widgets/detail/section_title.dart';
import 'package:flutter/material.dart';
import 'package:soccervio/reservation/widgets/home/terrain_card.dart';

class NearbyGrid extends StatefulWidget {
  final List<String> data;

  const NearbyGrid({Key? key, required this.data}) : super(key: key);

  @override
  State<NearbyGrid> createState() => _NearbyGridState();
}

class _NearbyGridState extends State<NearbyGrid> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1300),
      child: Column(
        children: [
          const SectionTitle(title: 'Nearby you'),
          Container(
            height: 115 * _recipes.length / 3,
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                          title: _recipes[index].name,
                          cookTime: _recipes[index].totalTime,
                          rating: _recipes[index].rating.toString(),
                          thumbnailUrl: _recipes[index].images);
                    },
                  ),
          ),
          // Container(
          //   height: 115 * _recipes.length / 3,
          //   margin: const EdgeInsets.only(bottom: 40),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     child: _isLoading
          //         ? Center(child: CircularProgressIndicator())
          //         : GridView.builder(
          //             shrinkWrap: true,
          //             physics: const NeverScrollableScrollPhysics(),
          //             gridDelegate:
          //                 const SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 3,
          //               mainAxisSpacing: 10,
          //               crossAxisSpacing: 8,
          //             ),
          //             itemCount: _recipes.length,
          //             itemBuilder: (context, index) {
          //               return Image.network(
          //                 // widget.data[index],
          //                 _recipes[index].images,
          //                 scale: 4,
          //               );
          //             },
          //           ),
          //   ),
          // ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
