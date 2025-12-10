import 'tile.dart';

/// Simple grid-based map used by pathfinding and building placement.
class TileMap {
  final int width;
  final int height;
  late final List<Tile> _tiles;

  TileMap({
    required this.width,
    required this.height,
  }) {
    _tiles = List.generate(
      width * height,
      (index) {
        final x = index % width;
        final y = index ~/ width;
        return Tile(x: x, y: y);
      },
    );
  }

  Tile tileAt(int x, int y) {
    final clampedX = x.clamp(0, width - 1);
    final clampedY = y.clamp(0, height - 1);
    return _tiles[clampedY * width + clampedX];
  }

  Iterable<Tile> get tiles => _tiles;

  bool isBuildable(int x, int y) => tileAt(x, y).buildable;
  bool isWalkable(int x, int y) => tileAt(x, y).walkable;
}
