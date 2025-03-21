class UIBox {
  PVector pos;
  String title;
  
  ArrayList<Renderable> content = new ArrayList<>();
  
  UIBox(float x, float y, float w, float h) {
    this.pos = new PVector(x, y);
  }
  
  void addRenderable(Renderable renderable) {
    content.add(renderable);
  }
  
  void render() {
    for (Renderable r : content) {
      r.render(pos.x, pos.y);
    }
  }
}
