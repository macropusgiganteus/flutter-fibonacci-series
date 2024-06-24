import 'dart:math';

import 'package:fibonacci_series/enums.dart';
import 'package:flutter/material.dart';

IconData getFibonacciIcon(FibonacciType type) {
  switch (type) {
    case FibonacciType.square:
      return Icons.square_outlined;
    case FibonacciType.circle:
      return Icons.circle;
    case FibonacciType.cross:
      return Icons.close;
    default:
      return Icons.close;
  }
}

FibonacciType getFibonacciType(int num) {
  if ((num % 5) == 0) {
    return FibonacciType.circle;
  }

  if ((num % 3) == 0) {
    return FibonacciType.square;
  }

  return FibonacciType.cross;
}

// Binet's Formula to calculate the 'n'th fibonacci number
int getFibonacciByIndex(int n) {
  final phi = (1 + sqrt(5)) / 2;
  final psi = (1 - sqrt(5)) / 2;
  final fibN = (pow(phi, n) - pow(psi, n)) ~/ sqrt(5);
  return fibN;
}
