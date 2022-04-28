import 'package:flutter/material.dart';

import 'cell.dart';


/// How many alive cells are next to the [cell]. The [cells] is the
/// list of all currently alive cells.
int countNeighbors(Cell cell, List<Cell> cells) {
  var counter = 0;
  for (final neighbor in cell.neighbors()) {
    if (cells.contains(neighbor)) {
      counter += 1;
    }
  }
  return counter;
}

void main() {
  // List of alive cells.
  final cells = [Cell(4, 4), Cell(5, 3), Cell(5, 2), Cell(4, 2), Cell(3, 2)];
  print(cells);

  for (var generation = 0; generation < 100; generation++) {
    // Step 1 (Checks which cells die due to over/underpopulation.
    for (final cell in cells) {
      final n = countNeighbors(cell, cells);
      // Will the cell die due to over/underpopulation next generation?
      if (!(n == 2 || n == 3)) {
        cell.die();
      }
    }
    // All cells with willDie = true will die in Step 3

    // Step 2 (Checks which cells will be born.)
    final counts = <Cell, int>{};
    for (final cell in cells) {
      for (final neighbor in cell.neighbors()) {
        if (!cells.contains(neighbor)) {
          final n = counts[neighbor];
          counts[neighbor] = (n ?? 0) + 1;
        }
      }
    }

    // Step 3 (Apply changes from Step 1 + Step 2.)
    cells.removeWhere((cell) => cell.willDie);
    counts.forEach((cell, count) {
      if (count == 3) {
        cells.add(cell);
      }
    });

    print(cells);
  }
}
