enum Type{L, Lrev, I, Z, Zrev, Square} //TODO: T (initT())


//DOWN -> 0
//RIGHT -> 1
//UP -> 2
//LEFT -> 3


class Brick {
  int xDir[];
  int yDir[];
  Square sq[];
  int patt[];
  int speed;
  int fspeed;
  int frame;
  boolean falling;
  boolean up, down, left, right;
  Type type;
  color c;
  Ghost g;
  int underY[];





  Brick(int sp, int t) {
    sq = new Square[4];
    xDir = new int[4];
    yDir = new int[4];
    patt = new int[3];
    g = new Ghost();
    switch (t) {
      case 0:
        initL();
        break;
      case 1:
        initLrev();
        break;
      case 2:
        initI();
        break;
      case 3:
        initZ();
        break;
      case 4:
        initZrev();
        break;
      case 5:
        initSquare();
        break;
    }

    initDir();
    
    if (sp > 0) {
    sq[0] = new Square(xMax/2, 0, c);
      for (int i=1; i < 4; i++) {
        sq[i] = new Square(sq[i-1].pos.x + xDir[patt[i-1]], sq[i-1].pos.y + yDir[patt[i-1]], c); //express coordinates of index n with pattern and index n-1' coordinates
      }
    }
    else if (sp == 0) {
      sq[0] = new Square(xMax+(width-xMax)/2-15, 90, c);
      for (int i=1; i < 4; i++) {
        sq[i] = new Square(sq[i-1].pos.x + xDir[patt[i-1]], sq[i-1].pos.y + yDir[patt[i-1]], c); //express coordinates of index n with pattern and index n-1' coordinates
      }
      return;
    }


    speed = sp;
    fspeed = sp;
    frame = 0;
    falling = true;
    up = false;
    down = false;
    left = false;
    right = false;
    
    type = Type.I;

  }
  
  void display() {
    sq[0].pos = new PVector(4*xMax/5, 100);
  }

  void draw() {
    for (int i=0; i < 4; i++) {
      sq[i].draw();   
    }
  }

  void fall() {
    if (!falling) 
      return;
      
    if (frame == fspeed) {
      sq[0].pos = new PVector(sq[0].pos.x, sq[0].pos.y +15);
      for (int i=1; i < 4; i++) {
        sq[i] = new Square(sq[i-1].pos.x + xDir[patt[i-1]], sq[i-1].pos.y + yDir[patt[i-1]], c); //express coordinates of index n with pattern and index n-1' coordinates
      }
      
    }
    frame++;
    if (frame > fspeed)
      frame = 0;

    updateUnderY();
    g.update(this);

  }



  void moveLeft() {
    for (int i=0; i < 4; i++) {
      sq[i].pos.x -= 15;    
    }
  }
  
  void moveRight() {
    for (int i=0; i < 4; i++) {
      sq[i].pos.x += 15;    
    }
  }
    
    

  void spin() {
    for (int i=0; i < 3; i++) {
      patt[i] = (patt[i] + 1) % 4;
    }
    
    for (int i=1; i < 4; i++) {
      sq[i] = new Square(sq[i-1].pos.x + xDir[patt[i-1]], sq[i-1].pos.y + yDir[patt[i-1]], c); //express coordinates of index n with pattern and index n-1' coordinates
    }
    
    for (int i=0; i < 4; i++)
      if (sq[i].pos.y < 0) 
        for (int j = 0; j < 4; j++)
          sq[i].pos.y += 15;
        
    for (int i=0; i < 4; i++) {
      if (sq[i].pos.x/15 < 0)
        moveRight();
      else if (sq[i].pos.x/15 > xMax/15)
        moveLeft();
      if (sq[i].pos.x > xMax-15 || lines[(int)b.sq[i].pos.y/15][(int)b.sq[i].pos.x/15] != null && sq[i].pos.x > sq[0].pos.x){
        moveLeft();
      }
      else if (sq[i].pos.x < 0 || lines[(int)b.sq[i].pos.y/15][(int)b.sq[i].pos.x/15] != null && sq[i].pos.x < sq[0].pos.x) {
        moveRight();
      }
    }    
    for (int i=0; i < 4; i++) {
        if (stopFall()) {
          for (int j=0; j < 4; j++) {
            sq[j].pos.y -= 15;    
          }
        }
    }

  }
  
  
  void updateUnderY() {
    for (int i =0; i < 4; i++) { //for each square of the current brick
      int x = sq[i].pos.x/15; //get x alignment
      underY[i] = 0; //reset y value

      for (int j=sq[i].pos.y/15; j < height/15; j++) { //for each square in the same column, starting from selected square
        if (lines[j][i] == null) //if we do not encounter a square
          underY[i] += 15; //increase gap beetween bottom and square
        else
          break;
      }


    }

  }


  
  void initDir() {
    xDir = new int[4];
    xDir[0] = 0;
    xDir[1] = 15;
    xDir[2] = 0;
    xDir[3] = -15;
    
    yDir = new int[4];
    yDir[0] = 15;
    yDir[1] = 0;
    yDir[2] = -15;
    yDir[3] = 0;
  }
  
  
  
  void initI() {
    patt[0] = 0;
    patt[1] = 0;
    patt[2] = 0;
    c = color(0, 255, 255);
    
  }
  
  void initL() {   
    patt[0] = 0;
    patt[1] = 0;
    patt[2] = 1;
    c = color(0, 0, 255);
  }
  
  void initLrev() {   
    patt[0] = 0;
    patt[1] = 0;
    patt[2] = 3;
    c = color(255, 128, 0);
  }
  
  void initSquare() {   
    patt[0] = 0;
    patt[1] = 1;
    patt[2] = 2;
    c = color(255, 255, 0);
  }
  
  void initZ() {   
    patt[0] = 1;
    patt[1] = 0;
    patt[2] = 1;
    c = color(255, 0, 0);
  }
  
  void initZrev() {   
    patt[0] = 1;
    patt[1] = 2;
    patt[2] = 1;
    c = color(0, 255, 0);
  }
  
  /*void initT() {   
    patt[0] = 0;
    patt[1] = 0;
    patt[2] = 1;
  }*/
  
  
}