import 'package:flutter/material.dart';
import '../../../helper/constant/constants.dart';

class CameraPop extends StatelessWidget {
  final VoidCallback onClickedCamera;
  final VoidCallback onClickedGallery;

  const CameraPop(
      {Key? key, required this.onClickedCamera, required this.onClickedGallery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          color: kBlack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Select your image from: ",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, color: kWhiteColor),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap:onClickedGallery,
              child: Container(
                margin: const EdgeInsets.only(right: 100),
                width: 250,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimaryOrangeColor,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: const [
                    Text(
                      "1. Gallery",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.image,
                      color: kPrimaryOrangeColor,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: onClickedCamera,
              child: Container(
                margin: const EdgeInsets.only(right: 100),
                width: 250,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimaryOrangeColor,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: const [
                    Text(
                      "2. Camera",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.camera_alt,
                      color: kPrimaryOrangeColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
