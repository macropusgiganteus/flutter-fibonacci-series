import 'package:fibonacci_series/enums.dart';
import 'package:fibonacci_series/utils.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final int index;
  final int num;
  final FibonacciType type;

  const ListItem(
      {super.key, required this.index, required this.num, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Index: $index, Number: $num'),
        Icon(getFibonacciIcon(type))
      ],
    );
  }
}
