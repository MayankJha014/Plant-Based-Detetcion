import 'package:flutter/material.dart';

class PlantBox extends StatelessWidget {
  const PlantBox({super.key});

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
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Image(
              image: AssetImage('assets/neem.jpg'),
              width: 100,
              height: 60,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Text(
              'Neem',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
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
