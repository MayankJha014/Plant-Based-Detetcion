import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600),
          ),
        ),
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(15),
        elevation: 1,
        backgroundColor: Colors.red[800],
      ),
    );

Future<File?> pickImages() async {
  File? images;
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (files != null && files.files.isNotEmpty) {
      final filePath = files.files.single.path!;

      images = File(filePath);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
