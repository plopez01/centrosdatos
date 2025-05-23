PVector remapPos(PVector vec) {
  return new PVector((float)vec.x/MAP_X * SCREEN_MIN, (float)vec.y/MAP_Y * SCREEN_MIN);
}

PVector remapPos(Entity e) {
  return new PVector((float)e.x/MAP_X * SCREEN_MIN, (float)e.y/MAP_Y * SCREEN_MIN);
}

void textCenter(String text, float x, float y) {
  text(text, x - textWidth(text)/2, y - textAscent()/2);
}

color bitrateToColor(int bitrate) {
  switch (bitrate) {
    case 1:
      return SENSOR_TIER_ONE;
    case 2:
      return SENSOR_TIER_TWO;
    case 5:
      return SENSOR_TIER_FIVE;
    }
  
  return color(124, 10, 240);
}
