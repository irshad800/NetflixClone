import 'package:flutter/material.dart';
import 'package:netflixdemo/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title, required this.image});
  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        Spacer(),
        Row(
          children: [
            Icon(
              Icons.cast,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Container(width: 20, height: 20, child: image),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ],
    );
  }
}
