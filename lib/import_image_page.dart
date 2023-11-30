import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImportImagePage extends StatefulWidget {
  const ImportImagePage({super.key});

  @override
  State<ImportImagePage> createState() => _ImportImagePageState();
}

class _ImportImagePageState extends State<ImportImagePage> {
  File? imageFile;

  void selectFile() async {
    XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);

    if (file != null) {
      setState(() {
        imageFile = File(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Import Image'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GestureDetector(
              child: Container(
                  color: Colors.grey[100],
                  child: imageFile != null
                      ? Image.file(File(imageFile!.path))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('Choose image to ')]),
                            ])),
              onTap: selectFile,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Text('Upload your photo'),
                  ),
                  SizedBox(height: 24.0),
                  MaterialButton(onPressed: () {}, child: Text('Take a photo')),
                ],
              )),
        ],
      ),
    );
  }
}
