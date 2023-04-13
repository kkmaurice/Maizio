import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';


class SoundPredictionScreen extends StatefulWidget {
  const SoundPredictionScreen({Key? key}) : super(key: key);

  @override
  State<SoundPredictionScreen> createState() => _SoundPredictionScreenState();
}

class _SoundPredictionScreenState extends State<SoundPredictionScreen> {

  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  File ? audioFile;

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }
        
  Future stop() async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
     setState(() {
       audioFile = File(path!);
     });
    print('Recorder audio: $audioFile');
  }

  Future pickFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
    
    if (result != null){
      //if(result == null) return;
      PlatformFile file = result.files.first;
      setState(() {
        audioFile = File(file.path ?? "");
      });
      print('Picked audio: $audioFile');
    }
    
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Mic permission not granted';
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  String formattedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;
    String parsedTime =
        "${getParsedTime(min.toString())}:${getParsedTime(sec.toString())}";
    return parsedTime;
  }

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12,),
                StreamBuilder<RecordingDisposition>(
                    stream: recorder.onProgress,
                    builder: (context, snapshot) {
                      final duration = snapshot.hasData
                          ? snapshot.data!.duration
                          : Duration.zero;
    
                      return Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text(
                          formattedTime(duration.inSeconds),
                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 40, color: Colors.white),
                        ),
                      );
                    }),
                    const SizedBox(height: 12,),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), //<-- SEE HERE
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }
                    setState(() {});
                  },
                  child: Icon(
                    recorder.isRecording ? Icons.stop : Icons.mic,
                    size: 52,
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Tap Mic to record breathe sound'),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () async{
                    await pickFromFile();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text('Pick Stored breath',style: TextStyle(fontSize: 17,color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}