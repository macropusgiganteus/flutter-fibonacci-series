import 'package:fibonacci_series/fibonacci_item.dart';
import 'package:fibonacci_series/list_item.dart';
import 'package:fibonacci_series/utils.dart';
import 'package:flutter/material.dart';

class FibonacciList extends StatefulWidget {
  const FibonacciList({super.key, required this.n});

  final int n;

  @override
  State<StatefulWidget> createState() {
    return _FibonacciListState();
  }
}

class _FibonacciListState extends State<FibonacciList> {
  List<FibonacciItem> items = [];

  @override
  // ignore: must_call_super
  initState() {
    items = List<FibonacciItem>.generate(
        widget.n,
        (int index) => FibonacciItem(
            index, getFibonacciByIndex(index), getFibonacciType(index)),
        growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
          itemCount: widget.n,
          itemBuilder: (ctx, idx) {
            return ListItem(
              index: idx,
              num: items.elementAt(idx).num,
              type: items.elementAt(idx).type,
            );
          }),
    );
  }
}
