class Sensor {
  Entity wrappedEntity;
  Entity target;
  
  PVector pos;
  int id;
  
  Sensor(int id, Entity wrappedEntity, Entity target) {
    this.wrappedEntity = wrappedEntity;
    this.target = target;
    
    this.id = id;
    pos = remapPos(wrappedEntity);
  }
  
  void render() {
    PVector targetPos = remapPos(target);
    
    switch (wrappedEntity.bitrate()) {
      case 1: fill(SENSOR_TIER_ONE); break;
      case 2: fill(SENSOR_TIER_TWO); break;
      case 5: fill(SENSOR_TIER_FIVE); break;
    }
    stroke(255, 230);
    
    line(pos.x, pos.y, targetPos.x, targetPos.y);
    
    noStroke();
    circle(pos.x, pos.y, 15);
    
    textSize(20);
    fill(255);
    text(id, pos.x + 10, pos.y + 10);
  }
}
