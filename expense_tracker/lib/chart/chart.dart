import 'package:flutter/material.dart';
import 'package:expense_tracker/chart/chart_bar.dart';

class Chart extends StatefulWidget {
  final int countFood;
  final int countTravel;
  final int countWork;
  final int countLeisure;

  const Chart({
    super.key,
    required this.countFood,
    required this.countLeisure,
    required this.countTravel,
    required this.countWork,
  });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    final int countTotal =
        widget.countFood +
        widget.countLeisure +
        widget.countTravel +
        widget.countWork;

    double safeFill(int count) {
      if (countTotal == 0) return 0;
      return (count / countTotal).clamp(0.0, 1.0);
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ChartBar(fill: safeFill(widget.countFood)),
                ChartBar(fill: safeFill(widget.countLeisure)),
                ChartBar(fill: safeFill(widget.countTravel)),
                ChartBar(fill: safeFill(widget.countWork)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.local_pizza, color: Colors.black),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.chair, color: Colors.black),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.train, color: Colors.black),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.laptop, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
