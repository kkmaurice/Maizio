// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite/tflite.dart';
import 'package:tflite_audio/tflite_audio.dart';

import '../prediction_screens/sound_prediction_screen2.dart';

class SoundScreen extends StatefulWidget {
  const SoundScreen({Key? key}) : super(key: key);

  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Respiratory sound"),
          content: const Text(
              "Do you want to detect pneumonia from sound instead?"),
          backgroundColor: Colors.grey.shade100,
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                   Navigator.of(context).pop();
                },
                child: const Text('No')       
            ),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SoundPredictionScreen2()));
                },
                child: const Text('Yes')       
            ),
            
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
            const SizedBox(height: 50,),
            Container(
              height: MediaQuery.of(context).size.height*0.42,
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color: Colors.deepOrange[700],
                  borderRadius: BorderRadius.circular(15)
                ),
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
                            Icons.mic,
                            color: Colors.deepOrange.shade900,
                            size: 60,
                          )),
                    ),
                    const SizedBox(height: 10,),
                   Text(
                'Tap button to Upload sound',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 17,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'upload sound by either tapping the mic button to record respiratory sound or upload sound from your gallery',textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 13,fontWeight: FontWeight.w200),
                ),
              ),
                  ],
                ),
            ),
            
            const SizedBox(height: 50,),
            Row(
              children: const [
                Icon(Icons.keyboard_arrow_right,size: 35,),
                Text('Notification', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 20,),
             Padding(
                padding: const EdgeInsets.only(left: 10,  right: 10),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 30),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Text(
                    '''Hold the phone in front of an x-ray image and press the button above to scan the image using a phone\'s camera. Make sure to use a good phone camera for clear results. 
                  Alternatively, you can also choose and image from the phones local storage and upload to be scanned by PneumoScan''',textAlign: TextAlign.justify,style: GoogleFonts.poppins(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w200),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}