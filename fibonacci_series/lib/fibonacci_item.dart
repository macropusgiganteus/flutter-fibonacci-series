import 'package:fibonacci_series/enums.dart';

class FibonacciItem {
  FibonacciItem(this.index, this.num, this.type,
      {this.status = ItemStatus.initial});

  final int index;
  final int num;
  final FibonacciType type;

  ItemStatus status = ItemStatus.initial;

  void selected() {
    status = ItemStatus.selected;
  }

  void unselected() {
    status = ItemStatus.unselected;
  }

  void reset() {
    status = ItemStatus.initial;
  }
}
