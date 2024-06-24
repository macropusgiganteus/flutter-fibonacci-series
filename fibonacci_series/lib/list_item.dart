import 'package:fibonacci_series/enums.dart';
import 'package:fibonacci_series/utils.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final int index;
  final int num;
  final FibonacciType type;

  final void Function()? onTap;

  final Color? backgroundColor;

  const ListItem(
      {super.key,
      required this.index,
      required this.num,
      required this.type,
      this.onTap,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(color: backgroundColor),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Index: $index, Number: $num'),
            Icon(getFibonacciIcon(type))
          ],
        ),
      ),
    );
  }
}
