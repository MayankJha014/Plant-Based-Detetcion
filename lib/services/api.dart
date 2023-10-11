import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:plant_based_detection/services/model.dart';
import 'package:plant_based_detection/utlis/utils.dart';
import 'package:http/http.dart' as http;

class ImageDetetcion {
  Future<PlantModel?> plantDetect({
    required BuildContext context,
    required File image,
  }) async {
    PlantModel plantData = PlantModel(detection: '', confidence: 0.0);
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.1.7:8000/predict'),
      );

      // Add the image file to the request as a MultipartFile
      var imageFile = await http.MultipartFile.fromPath('file', image.path);
      request.files.add(imageFile);

      // Send the request
      http.StreamedResponse response = await request.send();
      // print(image.path);
      // http.Response res = await http.post(
      //   Uri.parse('http://10.0.42.27:8000/predict'),
      //   body: json.encode(
      //     {'file': image.path},
      //   ),
      // );
      if (response.statusCode == 200) {
        // If the request is successful, parse the response
        var responseBody = await response.stream.bytesToString();
        print(responseBody);

        // Handle the response as needed
        plantData = PlantModel.fromJson(responseBody);
      } else {
        // Handle errors here
        print('HTTP Error: ${response.statusCode}');
        // Handle error response if needed
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return plantData;
  }
}
