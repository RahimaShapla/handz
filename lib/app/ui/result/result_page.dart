import 'dart:io';
import 'package:flutter/material.dart';
import '../../../helper/constant/constants.dart';
import '../../../helper/network/model/signtoimage.dart';

class ResultPage extends StatefulWidget {
  final String path;
  final List<ImageToSign> resultList;

  const ResultPage({Key? key, required this.path, required this.resultList})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? convertResult = "";

  @override
  void initState() {
   // for (int i = 0; i < widget.resultList.length; i++) {
     // convertResult = "${convertResult!}$i. ${widget.resultList[i].name} \n";
   // }
    if(widget.resultList.isNotEmpty) {
      convertResult = widget.resultList[0].name;
    }else{
      convertResult = "Hello";
    }
/*    ///todo this is a manual process to show demo
    if(widget.path.contains("hello")){
      convertResult = "Hello";
    }else if(widget.path.contains("goodbye")){
      convertResult = "Good Bye";
    }else if(widget.path.contains("please")){
      convertResult = "Please";
    }else if(widget.path.contains("drink")){
      convertResult = "I want to drink";
    }else{
      convertResult = "I want to eat";
    }*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryOrangeColor,
        elevation: 2.0,
        centerTitle: true,
        title: const Text("Result"),
        foregroundColor: kWhiteColor,
      ),
      body: resultBody(),
    );
  }

  resultBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Image(
              height: 400,
              width: 400,
              image: FileImage(
                File(widget.path),
              ),
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Image to Sign: ",
                    style: TextStyle(
                       fontFamily: "Poppins",
                        color: kBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),

                SizedBox(
                  width: 220,
                  child: Text(convertResult!,
                      style: const TextStyle(
                           fontFamily: "Poppins",
                           color: kBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
