import 'package:flutter/material.dart';
// import 'package:zakeeulss/components/card_component.dart';
// import 'package:zakeeulss/components/dicoding_comp.dart';
import 'package:zakeeulss/model/tourism_place.dart';

import 'detail_screen.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<int> cardItems = const <int>[1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata Bandung"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return dicodingCard(
              place.name, place.imageAsset, place.location, place);
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }

  InkWell dicodingCard(
      String name, String imageAsset, String location, TourismPlace place) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(
            place: place,
          );
        }));
      },
      child: Card(
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset(imageAsset)),
            Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(location)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
