import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_finder/ui/home_view.dart';

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
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  child: imageFile != null
                      ? Image.file(File(imageFile!.path), fit: BoxFit.cover)
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
          const SizedBox(height: 40.0),
          Icon(Icons.more_horiz),
          const SizedBox(height: 40.0),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(24.0)),
                    child: MaterialButton(
                      onPressed: selectFile,
                      child: const Text('Upload your photo'),
                    ),
                  ),
                  const SizedBox(height: 56.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(24.0)),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeView()));
                      },
                      child: const Text('Take a photo'),
                    ),
                  ),
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: () {},
          label: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Check'),
          )),
    );
  }
}
