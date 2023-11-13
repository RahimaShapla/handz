import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handz/app/ui/component/camera_pop_view.dart';
import 'package:handz/app/ui/home/home_bloc.dart';
import 'package:handz/helper/constant/constants.dart';
import 'package:handz/helper/router/route_constants.dart';
import 'package:handz/helper/utils/view/app_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../../helper/utils/view/dialog_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? _image;
  HomeBloc? _homeBloc;

  String mimeType = "png";
  bool isSelected = false;

  @override
  void didChangeDependencies() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: kWhiteColor,
      statusBarColor: kPrimaryOrangeColor,
      statusBarIconBrightness: Brightness.light,
    ));
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _homeBloc = HomeBloc();
    super.initState();
  }

  Future getImagePhone(isGallery) async {
    _image = await ImagePicker().pickImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera,
        maxHeight: 1024,
        maxWidth: 1024);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryOrangeColor,
        elevation: 2.0,
        centerTitle: true,
        title: const Text(
          "Handz",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: kWhiteColor),
        ),
        foregroundColor: kWhiteColor,
      ),
      body: homeBody(),
    );
  }

  homeBody() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text("Please Select an image",
            style: TextStyle(
                fontFamily: "Poppins",
                color: kBlack,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Stack(
            children: [
              SizedBox(
                height: 400,
                width: 400,
                child: _image != null
                    ? Image(
                        height: 400,
                        width: 400,
                        image: FileImage(
                          File(_image!.path),
                        ),
                        fit: BoxFit.cover,
                      )
                    : const Image(
                        height: 400,
                        width: 400,
                        image: AssetImage("assets/images/ic_placeholder.png"),
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: kTransparent,
                        builder: (context) {
                          return CameraPop(
                            onClickedCamera: () {
                              Navigator.pop(context);
                              getImagePhone(false);
                            },
                            onClickedGallery: () {
                              Navigator.pop(context);
                              getImagePhone(true);
                            },
                          );
                        });
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    color: kPrimaryOrangeColor,
                    size: 50,
                  ),
                ),
              )
            ],
          ),
        ),
        ButtonView(
          buttonText: "Submit",
          onClicked: () {
            if (_image == null) {
              showMessageDialog(context, "Please select image");
            } else {
              _homeBloc!.submitResource(context, _image!);
            }
          },
          prefixIconNeeded: true,
        )
      ],
    );
  }
}
