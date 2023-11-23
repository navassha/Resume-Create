import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_creater/extensions/responsive.dart';

class ImagePickerShowing extends StatefulWidget {
  const ImagePickerShowing({
    super.key,
  });

  @override
  State<ImagePickerShowing> createState() => _ImagePickerShowingState();
}

class _ImagePickerShowingState extends State<ImagePickerShowing> {
  File? seletedImage;
  Future pickimagefromgallery() async {
    final returnedimaeg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      seletedImage = File(returnedimaeg!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickimagefromgallery();
      },
      child: Container(
        width: context.width(200),
        height: context.width(200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            context.width(20),
          ),
        ),
        child: seletedImage == null
            ? Image.network(
                "https://i.pinimg.com/564x/fc/7e/ce/fc7ece8e8ee1f5db97577a4622f33975.jpg")
            : Image.file(seletedImage!),
      ),
    );
  }
}
