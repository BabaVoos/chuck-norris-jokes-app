import 'package:flutter/material.dart';

class MemeWidget extends StatelessWidget {

  final String meme;
  const MemeWidget({Key? key, required this.meme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(.7),
        borderRadius: BorderRadius.circular(
          16.0,
        ),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Text(
        meme,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
