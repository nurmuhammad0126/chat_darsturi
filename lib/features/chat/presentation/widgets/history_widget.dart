import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(Icons.person),
    );
  }
}
