import 'package:fibonacci_series/bottom_sheet.dart';
import 'package:fibonacci_series/enums.dart';
import 'package:fibonacci_series/fibonacci_item.dart';
import 'package:fibonacci_series/list_item.dart';
import 'package:fibonacci_series/utils.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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

  int unselectedIndex = -1;
  int selectedIndex = -1;

  FibonacciType? filterType;
  final ItemScrollController _scrollController = ItemScrollController();

  @override
  // ignore: must_call_super
  initState() {
    items = List<FibonacciItem>.generate(
        widget.n,
        (int index) => FibonacciItem(
            index, getFibonacciByIndex(index), getFibonacciType(index),
            status: ItemStatus.initial),
        growable: true);
  }

  void onSelectNewItem(FibonacciItem item) {
    setState(() {
      items.elementAt(item.index).selected();
      filterType = item.type;
      unselectedIndex = -1;
      selectedIndex = item.index;
    });
  }

  void onUnselectItem(FibonacciItem item) {
    setState(() {
      items.elementAt(item.index).unselected();
      unselectedIndex = item.index;
      selectedIndex = -1;
      Navigator.pop(context);

      final scrollToIdx = getUnselectedItems().indexOf(item);
      _scrollController.jumpTo(index: scrollToIdx);
    });
  }

  List<FibonacciItem> getSelectedItems() {
    return items
        .where((item) =>
            item.status == ItemStatus.selected && item.type == filterType)
        .toList();
  }

  List<FibonacciItem> getUnselectedItems() {
    return items.where((item) => item.status != ItemStatus.selected).toList();
  }

  @override
  Widget build(BuildContext context) {
    final unselectedItems = getUnselectedItems();

    return ScrollablePositionedList.builder(
        itemScrollController: _scrollController,
        itemCount: unselectedItems.length,
        itemBuilder: (ctx, idx) {
          final item = unselectedItems.elementAt(idx);
          return ListItem(
            key: GlobalObjectKey('${item.index}-${item.num}'),
            onTap: () {
              onSelectNewItem(item);

              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return CustomBottomSheet(
                    selectedIndex: selectedIndex,
                    selectedItems: getSelectedItems(),
                    onItemTap: (item) => onUnselectItem(item),
                  );
                },
              );
            },
            index: item.index,
            num: item.num,
            type: item.type,
            backgroundColor:
                unselectedIndex != -1 && unselectedIndex == item.index
                    ? Colors.red
                    : null,
          );
        });
  }
}
