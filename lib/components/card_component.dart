import 'package:flutter/material.dart';

void main() => runApp(const CardComponent());

class CardComponent extends StatelessWidget {
  const CardComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 217, 217, 217))),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: Image.asset(
              "images/farm-house.jpg",
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Farm House Lembang"),
                Text("Kota Bandung")
              ],
            ),
          )
        ],
      ),
    );
  }
}
