import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DashedCircleButton extends StatelessWidget {
  const DashedCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.grey.shade400,
      dashPattern: [10, 6],
      strokeWidth: 2,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: const Center(
          child: Icon(Icons.add, color: Colors.grey, size: 40),
        ),
      ),
    );
  }
}