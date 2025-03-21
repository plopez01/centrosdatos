class Datacenter {
  Entity wrappedEntity;
  PVector pos;

  Datacenter(Entity wrappedEntity) {
    this.wrappedEntity = wrappedEntity;

    pos = remapPos(new PVector(wrappedEntity.x, wrappedEntity.y));
  }

  void render() {
    noStroke();
    fill(255);

    rectMode(CENTER);
    square(pos.x, pos.y, 25);
  }
}
