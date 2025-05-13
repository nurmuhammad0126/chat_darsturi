import 'package:flutter/material.dart';

class ExternalAuthButtons extends StatelessWidget {
  final String title;
  final Widget logo;

  const ExternalAuthButtons({
    super.key,
    required this.title,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Theme.of(context).dividerColor;

    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [logo, const SizedBox(width: 15), Text(title)],
          ),
        ),
      ),
    );
  }
}