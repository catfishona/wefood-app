//import 'dart:io';

import 'package:flutter/material.dart';

class ProfileDonorWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileDonorWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          
          Positioned(
            bottom: 0,
            right: 4,
            child: isEdit ? buildEditIcon(Color(0xFFFF8F00)) : buildNoIcon(Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

    Widget buildNoIcon(Color color) => buildCircle(
        color: Colors.transparent,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            // isEdit ? Icons.add_a_photo : Icons.edit,
            Icons.add_a_photo,
            color: Colors.transparent,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
