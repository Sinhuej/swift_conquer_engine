enum TileType {
  ground,
  water,
  cliff,
  ore,
}

class Tile {
  final int x;
  final int y;
  TileType type;
  bool walkable;
  bool buildable;

  Tile({
    required this.x,
    required this.y,
    this.type = TileType.ground,
    this.walkable = true,
    this.buildable = true,
  });
}
