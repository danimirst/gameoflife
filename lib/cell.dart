import 'cell_component.dart';

class Cell {
  Cell(this.x, this.y);

  /// x, y represent the location of the cell.
  int x, y;

  /// Will the cell die in the next generation?
  bool get willDie => _willDie;
  bool _willDie = false;
  void die() {
    _willDie = true;
    component?.removeFromParent();
  }

  CellComponent? component;

  @override
  String toString() => '[$x, $y]';

  @override
  bool operator ==(Object other) =>
      (other is Cell) && (x == other.x) && (y == other.y);

  @override
  int get hashCode => x * 100000 + y;

  /// A list of neighbors (both dead or alive) next to this cell.
  List<Cell> neighbors() {
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
}