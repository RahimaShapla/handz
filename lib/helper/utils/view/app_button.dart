import 'package:flutter/material.dart';

import '../../constant/constants.dart';

class ButtonView extends StatefulWidget {
  final String buttonText;
  final Color buttonTextColor;
  final Color bgColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onClicked;
  final bool prefixIconNeeded;
  final bool fixWidth;
  final double width;

  const ButtonView(
      {Key? key,
      required this.buttonText,
      required this.onClicked,
      this.buttonTextColor = kWhiteColor,
      this.bgColor = kPrimaryOrangeColor,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w400,
      this.prefixIconNeeded = false,
      this.fixWidth = false,
      this.width = 130})
      : super(key: key);

  @override
  State<ButtonView> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fixWidth ? widget.width : double.infinity,
      margin: EdgeInsets.fromLTRB(
          widget.fixWidth ? 0 : 16, 0, widget.fixWidth ? 0 : 16, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: kTransparent)),
          foregroundColor: widget.buttonTextColor,
          backgroundColor: widget.bgColor,
        ),
        onPressed: widget.onClicked,
        child: Row(
        //  direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500,
                  color: widget.buttonTextColor),
            ),
            if (widget.prefixIconNeeded)
              const SizedBox(
                width: 10,
              ),
            if (widget.prefixIconNeeded)
              const Icon(
                Icons.arrow_forward_rounded,
                size: 25,
              ),
          ],
        ),
      ),
    );
  }
}
