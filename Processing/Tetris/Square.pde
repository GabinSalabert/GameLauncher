class Square {
  
  PVector pos;
  color c;
  
  Square(float x, float y, color c) {
    pos = new PVector(x, y);
    this.c = c;
  }
  
  Square(Square s, color c) {
    pos = new PVector(s.pos.x, s.pos.y);
    this.c = c;
  }
  
  void draw() {
    
    stroke(color(red(c) * (0.5), green(c) * (0.5), blue(c) * (0.5)));
    //rect(pos.x, pos.y, 10, 10);
    fill(c);
    
    rect(pos.x, pos.y, 15, 15);
  }

}