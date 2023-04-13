// ignore_for_file: implementation_imports


import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import 'package:tflite_audio/tflite_audio.dart';

class SoundPredictionScreen2 extends StatefulWidget {
  const SoundPredictionScreen2({super.key});

  @override
  State<SoundPredictionScreen2> createState() => _SoundPredictionScreen2State();
}

class _SoundPredictionScreen2State extends State<SoundPredictionScreen2> {

    // Some viables
  String _sound = "Press the button to start";
  String myTestresult = '';
  bool _recording = false;
  Stream<Map<dynamic, dynamic>>? recognitionStream;


   // load our model
 Future loadDataModelFiles() async {
    String? output = await  TfliteAudio.loadModel(
       model: 'assets/an.tflite',
       label: 'assets/labels2.txt',
       inputType: 'decodedWav',
       outputRawScores: false, 
       numThreads: 1,
       isAsset: true,
     );
    print(output);
  }

  @override
  void initState() {
    super.initState();
    //imagePicker = ImagePicker();
    loadDataModelFiles();
  }

   @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  void _recorder() {
    String recognition = "";
    if (!_recording) {
      setState(() => _recording = true);
      recognitionStream = TfliteAudio.startAudioRecognition(
        sampleRate: 44100,
        bufferSize: 22016,
        audioLength: 44032,
        numOfInferences: 5,
        detectionThreshold: 0.3, 
        averageWindowDuration: 1000,
        minimumTimeBetweenSamples: 30,
        suppressionTime: 1500,
        );
      recognitionStream!.listen((event) {
        recognition = event["recognitionResult"];
      }).onDone(() {
        setState(() {
          _recording = false;
          _sound = recognition.split(" ")[1];
        });
      });
   }
  } 

  // stop audio
   void _stop() {
    TfliteAudio.stopAudioRecognition();
    setState(() => _recording = false);
  }

  // For stored audio in the file
  void _storedAudioClassication() {
    //String recognition = '';
    //int inferenceTime = 0;
    try{
      recognitionStream =  TfliteAudio.startFileRecognition(
      audioDirectory: "assets/testing.wav",
      sampleRate: 44100,
      audioLength: 44032,
      detectionThreshold: 0.3,
      averageWindowDuration: 1000,
      minimumTimeBetweenSamples: 30,
      suppressionTime: 1500,
   );
   //print('$recognition["recognitionResult"]***********************');
   recognitionStream!.listen((event){
    myTestresult = event["recognitionResult"];
    print('$myTestresult *********************************');
      //results = event["inferenceTime"];
      //inferenceTime = event["recognitionResult"];
      }).onDone(() {
        setState(() {
          myTestresult;
        });
      });
    }catch(e){
      print(e.toString());
    }
      
    // .onDone(
    //    //Do something here when stream closes
    //  );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/background.jpg"),
          //   fit: BoxFit.cover,
          // ),
          color: Colors.cyan
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: const Text(
                  "What's this sound?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: _recorder,
                color: _recording ? Colors.grey : Colors.pink,
                textColor: Colors.white,
                child: Icon(Icons.mic, size: 60),
                shape: CircleBorder(),
                padding: EdgeInsets.all(25),
              ),
              MaterialButton(
                onPressed: _storedAudioClassication,
                //color: _recording ? Colors.grey : Colors.pink,
                textColor: Colors.white,
                child: Icon(Icons.mic, size: 60),
                shape: CircleBorder(),
                padding: EdgeInsets.all(25),
              ),
              Text(
                '$_sound',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                myTestresult,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ),
      ),
    );
  }
}