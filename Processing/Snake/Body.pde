class Body {
  int x = 0;
  int y = 0;

  //Constructor with body's positions
  public Body(int posx, int posy) {
    x = posx;
    y = posy;
  }

  //Initialization of positions
  public void setX(int v) { 
    x=v;
  }

  public void setY(int v) {
    y=v;
  }

  //Return positions
  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }
}