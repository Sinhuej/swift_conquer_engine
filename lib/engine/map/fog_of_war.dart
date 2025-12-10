/// Basic fog-of-war mask. UI layer can read this and render it visually.
class FogOfWar {
  final int width;
  final int height;
  late final List<bool> _visible;

  FogOfWar({
    required this.width,
    required this.height,
  }) {
    _visible = List<bool>.filled(width * height, false);
  }

  bool isVisible(int x, int y) {
    if (x < 0 || y < 0 || x >= width || y >= height) return false;
    return _visible[y * width + x];
  }

  void setVisible(int x, int y, bool value) {
    if (x < 0 || y < 0 || x >= width || y >= height) return;
    _visible[y * width + x] = value;
  }

  void clear() {
    for (var i = 0; i < _visible.length; i++) {
      _visible[i] = false;
    }
  }
}
