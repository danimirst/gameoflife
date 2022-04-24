import 'package:flutter/material.dart';
/// Cell represents a cell in the game of life.
class Cell {
  Cell(this.x, this.y);

  /// x, y represent the location of the cell.
  int x, y;

  /// Will the cell die in the next generation?
  bool willDie = false;

  @override
  String toString() => '[$x, $y]';

  @override
  bool operator ==(Object other) =>
      (other is Cell) && (x == other.x) && (y == other.y);

  @override
  int get hashCode => x * 100000 + y;
}

/// A list of neighbors (both dead or alive) next to the given [cell].
List<Cell> neighbors(Cell cell) {
  final x = cell.x;
  final y = cell.y;
  return [
    Cell(x - 1, y + 1),
    Cell(x, y + 1),
    Cell(x + 1, y + 1),
    Cell(x - 1, y),
    Cell(x + 1, y),
    Cell(x - 1, y - 1),
    Cell(x, y - 1),
    Cell(x + 1, y - 1),
  ];
}

/// How many alive cells are next to the [cell]. The [cells] is the
/// list of all currently alive cells.
int countNeighbors(Cell cell, List<Cell> cells) {
  var counter = 0;
  for (final neighbor in neighbors(cell)) {
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
        cell.willDie = true;
      }
    }
    // All cells with willDie = true will die in Step 3

    // Step 2 (Checks which cells will be born.)
    final counts = <Cell, int>{};
    for (final cell in cells) {
      for (final neighbor in neighbors(cell)) {
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

