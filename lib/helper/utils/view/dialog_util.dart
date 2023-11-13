import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handz/helper/constant/constants.dart';

showMessageDialog(context, message) {
  showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Text(
          message,
          style: const TextStyle(
            // color: kBlack,
              fontFamily: "Switzer",
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        actions: [
          CupertinoDialogAction(
              child: const Text(
                "OK",
                style: TextStyle(
                    fontFamily: "Switzer",
                    // color: kBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    },
  );
}

innerAppLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: kWhiteColor,
        elevation: 4,
        content: CupertinoActivityIndicator(radius: 30, color: kPrimaryOrangeColor),
      );
    },
  );
}