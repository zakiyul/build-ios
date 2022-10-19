import 'package:flutter/material.dart';
import 'package:zakeeulss/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: bodyComponent(context)),
    );
  }

  SingleChildScrollView bodyComponent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(children: [
            Image.asset(place.imageAsset),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  const FavoriteButton(),
                ],
              ),
            )
          ]),
          headingComponent(place.name),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconsInfo(const Icon(Icons.calendar_today), place.openDays),
                iconsInfo(const Icon(Icons.access_time), place.openTime),
                iconsInfo(const Icon(Icons.monetization_on), place.ticketPrice)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              place.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          imageFeature(),
        ],
      ),
    );
  }

  SizedBox imageFeature() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: place.imageUrls.map((url) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(url),
            ),
          );
        }).toList(),
      ),
    );
  }

  Column iconsInfo(Icon icon, String text) {
    return Column(
      children: [
        icon,
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
        )
      ],
    );
  }

  Container headingComponent(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Oswald'),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.amber,
      child: IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          )),
    );
  }
}
