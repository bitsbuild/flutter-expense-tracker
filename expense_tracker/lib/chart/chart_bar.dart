import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  late double fill;
  ChartBar({super.key, required this.fill});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              color: Colors.black, // sub-content inside white content
            ),
          ),
        ),
      ),
    );
  }
}
