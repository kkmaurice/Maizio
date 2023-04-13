// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_screen.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/ma.jpg'),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Text(
                'Maizio',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Detect Maize Diseases with Artificial Intelligence',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 40,
              ),

              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ImageScreen())),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.image_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Analyse Image',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 20),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 40,
                        color: Colors.green.shade900,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // GestureDetector(
              //   onTap: () => Navigator.of(context)
              //       .push(MaterialPageRoute(builder: (context) => const SoundScreen())),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: 50,
              //     padding: const EdgeInsets.only(right: 10),
              //     decoration: BoxDecoration(
              //         color: Colors.grey[400],
              //         borderRadius: BorderRadius.circular(20)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           width: 50,
              //           height: 50,
              //           decoration: const BoxDecoration(
              //               color: Color(0xFFf5641d), shape: BoxShape.circle),
              //           child: const Icon(
              //             Icons.mic,
              //             size: 40,
              //             color: Colors.white,
              //           ),
              //         ),
              //         Text(
              //           'Sound Analyzer',
              //           style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              //         ),
              //         Icon(
              //           Icons.keyboard_arrow_right,size: 40,
              //           color: Colors.deepOrange.shade900,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Maizio AI Capabilities',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  //height: 150,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10, right: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.mode_edit,
                            color: Colors.white,
                          ),
                        ),
                        title: Text('Maize Leaf Image',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 15)),
                        subtitle: Text('Classify with images',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 12)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                            'Maize leaf image classification is a task of identifying the type of maize leaf disease from the image of the maize leaf. The app uses a deep learning model to classify the maize leaf disease from the image of the maize leaf. The model is trained on a dataset of maize leaf images with 4 different classes of maize leaf diseases.',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 12)),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              // Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     padding: const EdgeInsets.only(left: 10, right: 8),
              //     decoration: BoxDecoration(
              //       color: Colors.grey[200],
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Column(
              //       children: [
              //         ListTile(
              //           leading: const CircleAvatar(
              //             backgroundColor: Color(0xFFf5641d),
              //             child: Icon(Icons.mode_edit),
              //           ),
              //           title: Text('X-ray Image',
              //               style: GoogleFonts.poppins(
              //                   color: Colors.black, fontSize: 15)),
              //           subtitle: Text('Classify with images',
              //               style: GoogleFonts.poppins(
              //                   color: Colors.black, fontSize: 12)),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 14),
              //           child: Text(
              //               'PneumoScan app helps a doctor scan for the presence of pneumonia in a patient\'s respiratory sound and gives instant results depending on status of the respiratory sound',
              //               style: GoogleFonts.poppins(
              //                   color: Colors.black, fontSize: 12)),
              //         ),
              //       ],
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
