class Sensor {
  Entity wrappedEntity;
  Entity target;

  PVector pos;
  int id;
  int sentData;

  Sensor(int id, int sentData, Entity wrappedEntity, Entity target) {
    this.wrappedEntity = wrappedEntity;
    this.target = target;

    this.id = id;
    this.sentData = sentData;
    pos = remapPos(wrappedEntity);
  }

  void render() {
    PVector targetPos = remapPos(target);
    color myColor = bitrateToColor(wrappedEntity.bitrate());

    color targetColor;
    if (target.type == EntityType.SENSOR) {
      targetColor = bitrateToColor(target.bitrate());
    } else targetColor = color(255, 230);

    fill(myColor);

    float time = constrain((tan(radians(frameCount))+1)/2, 0, 1);


    strokeWeight(1);
    stroke(255, 230);
    //stroke(lerpColor(myColor, targetColor, time));

    if (wrappedEntity.bitrate()*3 == sentData) stroke(255, 0, 0);
    
    line(pos.x, pos.y, targetPos.x, targetPos.y);

    println(time);

    PVector dataPointPos = PVector.lerp(pos, targetPos, time);
    strokeWeight(sentData);

    point(dataPointPos.x, dataPointPos.y);
    //textSize(20);
    //text(sentData, dataPointPos.x, dataPointPos.y);
    
    noStroke();
    circle(pos.x, pos.y, 15);

    textSize(20);
    fill(255);
    text(id, pos.x + 10, pos.y + 10);
  }
}
