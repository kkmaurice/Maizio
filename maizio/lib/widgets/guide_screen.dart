import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Guide extends StatelessWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text('How to use the app',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, top: 10, right: 30, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Text(
              '1. Click on the camera icon to take a picture of the maize leaf or pick from your local file\n2. Click on the gallery icon to upload a picture of the maize leaf\n3. Click on the upload button to upload the picture to the server\n4. Wait for the result to be displayed\n5. Click on the result to view the details of the disease',
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    );
  }
}
