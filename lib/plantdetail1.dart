import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_based_detection/global.dart';

class PlantDetail1 extends StatefulWidget {
  final int index;
  const PlantDetail1({super.key, required this.index});

  @override
  State<PlantDetail1> createState() => _PlantDetail1State();
}

class _PlantDetail1State extends State<PlantDetail1>
    with TickerProviderStateMixin {
  int swipe = 0;

  @override
  void initState() {
    super.initState();
  }

  SwiperController swiperController =
      SwiperController(); // Create a SwiperController

  @override
  Widget build(BuildContext context) {
    List<Widget> cont = [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 88, 88, 88),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Scientific Name : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  plantList[widget.index].scientific,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 190,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    plantList[widget.index].description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 88, 88, 88),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Advantage',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: plantList[widget.index].advantage.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero, // Remove padding

                  itemBuilder: (context, int ind) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          plantList[widget.index].advantage[ind],
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 88, 88, 88),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Precaution',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: plantList[widget.index].disadvantage.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero, // Remove padding

                  itemBuilder: (context, int ind) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          plantList[widget.index].disadvantage[ind],
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 41, 49),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.32),
        child: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          flexibleSpace: Image.network(
            plantList[widget.index].image,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  plantList[widget.index].localName,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 290,
                  child: Swiper(
                    loop: true,
                    controller: swiperController,
                    pagination: const SwiperPagination(
                      builder: SwiperPagination.dots,
                    ),
                    layout: SwiperLayout.TINDER,
                    itemBuilder: (context, int ind) {
                      return cont[ind];
                    },
                    itemCount: 3,
                    index: swipe,
                    onIndexChanged: (newIndex) {
                      setState(() {
                        swipe =
                            newIndex; // Update ind when the Swiper index changes
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                // if (swipe < 2) {
                swiperController
                    .next(); // Go to the next item using the controller
                // }
              },
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
          )
        ],
      ),
    );
  }
}
