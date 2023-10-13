import 'package:flutter/material.dart';
import 'package:plant_based_detection/global.dart';

class PlantBox extends StatelessWidget {
  final int index;
  const PlantBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 85,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(101, 255, 255, 255),
        border: Border.all(
          width: 2.0,
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Image.network(
              plantList[index].image,
              width: 100,
              height: 60,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Text(
              plantList[index].localName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Image(
              image: AssetImage('assets/right_arrow.png'),
            ),
          )
        ],
      ),
    );
  }
}
