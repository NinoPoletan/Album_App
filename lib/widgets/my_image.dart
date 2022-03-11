import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String path;
  const MyImage(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressAction,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
      child: Image(
        image: AssetImage(path),
        fit: BoxFit.cover,
        height: 500,
        width: 500,
      ),
    );
  }

  void pressAction() => print("Pressed");
}
