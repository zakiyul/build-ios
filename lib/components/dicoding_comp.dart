import 'package:flutter/material.dart';
// import 'package:zakeeulss/detail_screen.dart';

void main() => runApp(const DicodingComp());

class DicodingComp extends StatelessWidget {
  const DicodingComp({super.key});
  // const DicodingComp({Key key, this.name}) : super(key: key);
  // final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return const DetailScreen(place:  ,);
      //   }));
      // },
      child: Card(
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset('images/farm-house.jpg')),
            Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Farm House Lembang',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Kota Bandung')
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
