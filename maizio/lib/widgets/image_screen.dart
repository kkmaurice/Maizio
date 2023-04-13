// ignore_for_file: unnecessary_const, avoid_unnecessary_containers, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../prediction_screens/image_predict_screen.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  Future<File>? imageFile;
  File? _image;
  //String result = '';
  ImagePicker? imagePicker;
  List _predictions = [];
  //bool _isPredicting = false;

  // pick image from gallery
  Future selectPhotoFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);

      await doImageClassification();
      setState(() {
        //_image;
      });
    }
  }

  // pick image from camera
  Future capturePhotoFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      await doImageClassification();
      setState(() {
        //_image;
      });
    }
  }

  // load our model
  Future loadDataModelFiles() async {
    String? output = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    print(output);
  }

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    loadDataModelFiles();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
      path: _image!.path,
      imageMean: 127.5,
      imageStd: 127.5,
      numResults: 6, // 2 results per image prediction
      threshold: 0.05,
      asynch: true,
    );
    print(recognitions!.length.toString());
    print(recognitions);
    setState(() {
      _predictions = recognitions;
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Options",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Press camera to capture image or file to pick image from local file",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          //backgroundColor: Colors.grey.shade900,
          actions: <Widget>[
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                ),
                onPressed: () {
                  selectPhotoFromGallery().then(
                      (value) => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => _image != null
                              ? ImagePredictionPage(
                                  imageFile: _image!,
                                  prediction: _predictions,
                                )
                              : Container(
                                  child: const Center(
                                      child: Text("No image found")),
                                ))));
                },
                icon: const Icon(Icons.image),
                label: const Text('file')),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                ),
                onPressed: () {
                  CircularProgressIndicator(
                    color: Colors.green.shade900,
                  );
                  capturePhotoFromCamera().then(
                      (value) => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => _image != null
                              ? ImagePredictionPage(
                                  imageFile: _image!,
                                  prediction: _predictions,
                                )
                              : Container(
                                  child: const Center(
                                      child: Text("No image found")),
                                ))));
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('camera')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.42,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                        onPressed: () {
                          _showDialog(context);
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.deepOrange.shade900,
                          size: 60,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tap button to Upload image',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'upload image by either tapping the camera button to take a picture of x-ray image or upload from your gallery',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 35,
                ),
                Text(
                  'Notification',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, right: 30, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Text(
                  '''Hold the phone in front of maize leaf image and press the button above to scan the image using a phone\'s camera. Make sure to use a good phone camera for clear results.\nAlternatively, you can also choose and image from the phones local storage and upload to be scanned by PneumoScan''',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w200),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
