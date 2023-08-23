import 'package:flutter/material.dart';
import '../../widgets/app_text.dart';

class CardBox extends StatefulWidget {
  final String cardText;
  final String imagePath;
  final void Function()? onTap;

  const CardBox({
    super.key,
    required this.cardText,
    required this.imagePath,
    this.onTap,
  });

  @override
  State<CardBox> createState() => _CardBoxState();
}

class _CardBoxState extends State<CardBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 90,
        width: 60,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.imagePath,
              height: 40,
              width: 40,
            ),
            AppText(
              title: widget.cardText,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
