// ignore_for_file: avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, must_be_immutable

import 'dart:io';
import 'dart:math';

import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../computational_helpers.dart';

class ImagePredictionPage extends StatefulWidget {
  ImagePredictionPage(
      {Key? key, required this.imageFile, required this.prediction})
      : super(key: key);

  File imageFile;
  List prediction;
  //String result;

  @override
  State<ImagePredictionPage> createState() => _ImagePredictionPageState();
}

class _ImagePredictionPageState extends State<ImagePredictionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      widget.imageFile,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 390,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(20)),
                child: Text('Classification Results',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white)),
              ),

              //Text(widget.prediction[1]['index']==2),

              const SizedBox(
                height: 8,
              ),
              //Text(widget.prediction[1]),
              Column(
                  children: List.generate(
                      1,
                      (index) => Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  // First raw
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //first card inside first row
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Column(
                                          children: [
                                            CircularPercentIndicator(
                                                radius: 40.0,
                                                lineWidth: 13.0,
                                                animation: true,
                                                animationDuration: 1500,
                                                percent: ComputationalHelper
                                                    .generatePercentage(
                                                        index: 0,
                                                        lookupData:
                                                            widget.prediction),
                                                //  widget.prediction[0]['index'] == 0 ? widget.prediction[index]['confidence']*100 / 100 : 0.0,
                                                center: Text(ComputationalHelper
                                                    .generateText(
                                                        index: 0,
                                                        lookupData:
                                                            widget.prediction)),
                                                backgroundColor:
                                                    Colors.grey[500]!,
                                                circularStrokeCap:
                                                    CircularStrokeCap.round,
                                                progressColor:
                                                    Colors.blue.shade700),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Common Rust',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //second card inside first row
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Column(
                                          children: [
                                            CircularPercentIndicator(
                                              radius: 40.0,
                                              lineWidth: 13.0,
                                              animation: true,
                                              animationDuration: 1500,
                                              percent: ComputationalHelper
                                                  .generatePercentage(
                                                      index: 1,
                                                      lookupData:
                                                          widget.prediction),
                                              center: Text(
                                                ComputationalHelper
                                                    .generateText(
                                                        index: 1,
                                                        lookupData:
                                                            widget.prediction),
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                              ),
                                              backgroundColor:
                                                  Colors.grey[500]!,
                                              circularStrokeCap:
                                                  CircularStrokeCap.round,
                                              progressColor:
                                                  Colors.blue.shade700,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('Grey Leaf Spot',
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Second row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Column(
                                          children: [
                                            CircularPercentIndicator(
                                              radius: 40.0,
                                              lineWidth: 13.0,
                                              animation: true,
                                              animationDuration: 1500,
                                              percent: ComputationalHelper
                                                  .generatePercentage(
                                                      index: 2,
                                                      lookupData:
                                                          widget.prediction),
                                              center: Text(
                                                  ComputationalHelper
                                                      .generateText(
                                                          index: 2,
                                                          lookupData: widget
                                                              .prediction),
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16)),
                                              circularStrokeCap:
                                                  CircularStrokeCap.round,
                                              backgroundColor:
                                                  Colors.grey[500]!,
                                              progressColor:
                                                  Colors.blue.shade700,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Blight',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // third card inside second raw
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Column(
                                          children: [
                                            CircularPercentIndicator(
                                              radius: 40.0,
                                              lineWidth: 13.0,
                                              animation: true,
                                              animationDuration: 1500,
                                              percent: ComputationalHelper
                                                  .generatePercentage(
                                                      index: 3,
                                                      lookupData:
                                                          widget.prediction),
                                              center: Text(
                                                  ComputationalHelper
                                                      .generateText(
                                                          index: 3,
                                                          lookupData: widget
                                                              .prediction),
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16)),
                                              circularStrokeCap:
                                                  CircularStrokeCap.round,
                                              backgroundColor:
                                                  Colors.grey[500]!,
                                              progressColor:
                                                  Colors.blue.shade700,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Healthy',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Column(
                                          children: [
                                            CircularPercentIndicator(
                                              radius: 40.0,
                                              lineWidth: 13.0,
                                              animation: true,
                                              animationDuration: 1500,
                                              percent: ComputationalHelper
                                                  .generatePercentage(
                                                      index: 4,
                                                      lookupData:
                                                          widget.prediction),
                                              center: Text(
                                                  ComputationalHelper
                                                      .generateText(
                                                          index: 4,
                                                          lookupData: widget
                                                              .prediction),
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16)),
                                              circularStrokeCap:
                                                  CircularStrokeCap.round,
                                              backgroundColor:
                                                  Colors.grey[500]!,
                                              progressColor:
                                                  Colors.blue.shade700,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Unknown',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15)),
                child: Text('Graphical Illustrations',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white)),
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Chip(
                      backgroundColor: Colors.green[100],
                      padding: const EdgeInsets.all(10),
                      label: Text('Bar chart',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                  )),
              Column(
                children: List.generate(
                  1,
                  (index) => Padding(
                    padding: const EdgeInsets.all(14),
                    child: AspectRatio(
                      aspectRatio: 16 / 15,
                      child: DChartBar(
                        data: [
                          {
                            'id': 'Bar',
                            'data': [
                              {
                                'domain': 'Co-Rust',
                                'measure':
                                    ComputationalHelper.generateGraphPercentage(
                                        index: 0, lookupData: widget.prediction)
                              },
                              {
                                'domain': 'Gr-Le',
                                'measure':
                                    ComputationalHelper.generateGraphPercentage(
                                        index: 1, lookupData: widget.prediction)
                              },
                              {
                                'domain': 'Blight',
                                'measure':
                                    ComputationalHelper.generateGraphPercentage(
                                        index: 2, lookupData: widget.prediction)
                              },
                              {
                                'domain': 'Healthy',
                                'measure':
                                    ComputationalHelper.generateGraphPercentage(
                                        index: 3, lookupData: widget.prediction)
                              },
                              {
                                'domain': 'Unknown',
                                'measure':
                                    ComputationalHelper.generateGraphPercentage(
                                        index: 4, lookupData: widget.prediction)
                              },
                            ],
                          },
                        ],
                        yAxisTitle: 'Image classes',
                        xAxisTitle: 'Percentage per class',
                        measureMin: 0,
                        measureMax: 100,
                        minimumPaddingBetweenLabel: 10,
                        domainLabelPaddingToAxisLine: 16,
                        axisLineTick: 2,
                        axisLinePointTick: 2,
                        axisLinePointWidth: 10,
                        axisLineColor: Colors.black,
                        measureLabelPaddingToAxisLine: 16,
                        verticalDirection: true,
                        barColor: (barData, index, id) =>
                            barData['measure'] >= 50
                                ? Colors.green.shade700
                                : Colors.green.shade200,
                        barValue: (barData, index) => '${barData['measure']}%',
                        showBarValue: true,
                        barValuePosition: BarValuePosition.outside,
                      ),
                    ),
                  ),
                ),
              ),

              // const SizedBox(height: 20,),
              // // Doughnut chart
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 15),
              //     child: Text('Doughnut chart',style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
              //   )),
              // Column(
              //   children: List.generate(1,(index) => Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: AspectRatio(
              //     aspectRatio: 16 / 15,
              //     child: DChartPie(
              //       data: [
              //         {'domain': 'Nor', 'measure': ComputationalHelper.generateGraphPercentage(index: 0, lookupData: widget.prediction)},
              //         {'domain': 'Pn-Bac', 'measure': ComputationalHelper.generateGraphPercentage(index: 1, lookupData: widget.prediction)},
              //         {'domain': 'Pn-Vir', 'measure': ComputationalHelper.generateGraphPercentage(index: 2, lookupData: widget.prediction)},
              //         {'domain': 'Unkno', 'measure': ComputationalHelper.generateGraphPercentage(index: 3, lookupData: widget.prediction)},
              //       ],
              //       fillColor: (pieData, index) {
              //         switch (pieData['domain']) {
              //           case 'Nor':
              //             return Colors.blue;
              //           case 'Pne-Bac':
              //             return Colors.green;
              //           case 'Pne-Vir':
              //             return Colors.brown;
              //           default:
              //             return Colors.orange;
              //         }
              //       },
              //       pieLabel: (pieData, index) {
              //         return "${pieData['domain']}:\n${pieData['measure']}%";
              //       },
              //       labelPosition: PieLabelPosition.outside,
              //       donutWidth: 35,
              //     ),
              //   ),
              // ),
              //   ).toList(),
              //)
            ],
          ),
        ),
      ),
    );
  }
}
