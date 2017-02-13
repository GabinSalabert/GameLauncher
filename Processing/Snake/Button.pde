class Button {
  float x;
  float y;
  float w; 
  float h;
  int z;

  public Button(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }

  public void drawBe() {
    fill(0, 0, 0);
    rect(x, y, w, h);
    stroke(150, 150, 150);
    strokeWeight(3);
    rect(x, y, w, h);
    fill(150, 150, 150);
    text("Exit", x+61, y+20);
  }

  public void drawBr() {
    fill(0, 0, 0);
    rect(x, y, w, h);
    stroke(150, 150, 150);
    strokeWeight(3);
    rect(x, y, w, h);
    fill(150, 150, 150);
    text("Retry", x+61, y+20);
  }
  
  public void drawBs() {
    fill(0, 0, 0);
    rect(x, y, w, h);
    stroke(150, 150, 150);
    strokeWeight(3);
    rect(x, y, w, h);
    fill(150, 150, 150);
    text("Solo", x+61, y+20);
  }
  
  public void drawBd() {
    fill(0, 0, 0);
    rect(x, y, w, h);
    stroke(150, 150, 150);
    strokeWeight(3);
    rect(x, y, w, h);
    fill(150, 150, 150);
    text("Duo", x+61, y+20);
  }

  public void quit() {
    if (mousePressed) {
      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
        println("Ok, quitting.");
        exit();
      }
    }
  }
  
  public int retry() {
    if (mousePressed) {
      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
        println("Ok, retrying.");
        println(jeu.unJoueur);
        println(jeu.deuxJoueur);
        return 42;
      }
    }
    return 0;
  }
  
  public int playS() {
    if (mousePressed) {
      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
         return 1;
      }
    }
    
    return 0;
  }
  
  public int playD() {
    if (mousePressed) {
      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
         return 2;
      }
    }
    
    return 0;
  }
}