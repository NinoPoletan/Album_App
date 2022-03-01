import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String path;
  const MyImage(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(path),
      fit: BoxFit.cover,
    );
  }

  void pressAction() => print("Pressed");
}
