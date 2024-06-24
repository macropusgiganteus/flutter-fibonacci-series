import 'package:fibonacci_series/fibonacci_item.dart';
import 'package:fibonacci_series/list_item.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet(
      {super.key,
      required this.selectedItems,
      this.onItemTap,
      required this.selectedIndex});

  final int selectedIndex;
  final List<FibonacciItem> selectedItems;
  final void Function(FibonacciItem item)? onItemTap;

  final ItemScrollController _scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final scrollToIdx =
        selectedItems.indexWhere((item) => item.index == selectedIndex);
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollController.jumpTo(index: scrollToIdx));

    return SizedBox(
      height: 400,
      child: ScrollablePositionedList.builder(
          itemScrollController: _scrollController,
          itemCount: selectedItems.length,
          itemBuilder: (context, idx) {
            final item = selectedItems.elementAtOrNull(idx)!;
            final bgColor = selectedIndex != -1 && selectedIndex == item.index
                ? Colors.green
                : null;

            return ListItem(
                index: item.index,
                num: item.num,
                type: item.type,
                onTap: onItemTap != null ? () => onItemTap!(item) : null,
                backgroundColor: bgColor);
          }),
    );
  }
}
