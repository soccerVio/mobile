import 'package:flutter/material.dart';
import 'package:soccervio/reservation/dummy.dart';
import 'package:soccervio/reservation/widgets/home/home_header.dart';
import 'package:soccervio/reservation/widgets/home/nearby_grid.dart';
import 'package:soccervio/reservation/widgets/home/popular_list.dart';
import 'package:soccervio/reservation/widgets/home/search_bar.dart';
import 'package:soccervio/reservation/widgets/home/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const HomeHeader(),
            const SearchBar(),
            const Chips(),
            PopularList(items: popular),
            NearbyGrid(data: nearby),
          ],
        ),
      ),
    );
  }
}
