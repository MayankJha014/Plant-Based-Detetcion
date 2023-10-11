import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_based_detection/services/api.dart';
import 'package:plant_based_detection/services/model.dart';
import 'package:plant_based_detection/component/plant_box.dart';
import 'package:plant_based_detection/plant_detail.dart';
import 'package:plant_based_detection/utlis/utils.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? images;
  PlantModel? dataModel;
  bool loading = false;

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      loading = true;
    });
    var data =
        await ImageDetetcion().plantDetect(image: res!, context: context);
    setState(() {
      dataModel = data;
      images = res;
    });
    setState(() {
      loading = false;
    });
    if (dataModel != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => PlantDetail(
                plantName: dataModel!.detection,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return loading
        ? Lottie.asset('assets/loading.json')
        : DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 24, 23, 31),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage(
                                  'assets/rectangle.png',
                                ),
                                filterQuality: FilterQuality.high,
                                width: 55,
                                height: 55,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 120,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.0),
                                        child: Text(
                                          'Hello,',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Kirti Sanon',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/bookmark.png'),
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TabBar(
                              unselectedLabelColor: Colors.redAccent,
                              indicatorPadding: const EdgeInsets.all(
                                2,
                              ),
                              indicator: ShapeDecoration(
                                color: const Color.fromARGB(255, 240, 238, 238),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              tabs: [
                                Tab(
                                  child: Container(
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Scan",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                const Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Search",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Articles",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 200,
                            child: TabBarView(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    // color: Colors.blue[50],
                                  ),
                                  padding: const EdgeInsets.all(5.0),
                                  // color: Color.fromARGB(255, 230, 230, 230),
                                  // color: Color.fromARGB(255, 255, 236, 253),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: selectImages,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Image(
                                              image:
                                                  AssetImage('assets/scan.png'),
                                              height: 150,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    // color: Colors.blue[50],
                                  ),
                                  padding: const EdgeInsets.all(5.0),
                                  // color: Color.fromARGB(255, 230, 230, 230),
                                  // color: Color.fromARGB(255, 255, 236, 253),
                                  child: const SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image(
                                            image:
                                                AssetImage('assets/scan.png'),
                                            height: 150,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    // color: Colors.blue[50],
                                  ),
                                  padding: const EdgeInsets.all(5.0),
                                  // color: Color.fromARGB(255, 230, 230, 230),
                                  // color: Color.fromARGB(255, 255, 236, 253),
                                  child: const SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image(
                                            image:
                                                AssetImage('assets/scan.png'),
                                            height: 150,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),

                                // Icon(Icons.directions_bike, size: 350),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 15,
                        ),
                        child: Text(
                          'Recent Post',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => PlantDetail(
                                  plantName: dataModel!.detection,
                                ),
                              ),
                            );
                          },
                          child: const PlantBox(),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: PlantBox(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: PlantBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
