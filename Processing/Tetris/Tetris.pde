Brick b;

int maxY[];
Square lines[][];

void setup() {
  size(600, 600);
  frameRate(60);
  
  maxY = new int[width/15];
  lines = new Square[height/15][width/15];
  
  textFont(createFont("Time New Roman", 15)); //Choose a font-family
  textAlign(LEFT, CENTER); //Choose where you want it
  
  for (int i = 0; i < width/15; i++) { //for each column
    maxY[i] = height-15; //init max height at the bottom
  }
  
  for (int i = 0; i < height/15; i++) { //for each column
    lines[i] = new Square[width/15];
    for (int j=0; j < width/15; j++) {
      lines[i][j] = null;
    }
  }

  b = new Brick(30, (int)random(5));
}



void draw() {
  background(0);

  
  for (int i=0; i < height/15; i++) {
    for (int j=0; j < width/15; j++) {
      if (lines[i][j] != null) 
        lines[i][j].draw();
    } 
  }

  b.fall();
  b.draw();
  clearLine();
  eat();
  if (b.frame == b.fspeed)
    pile();
}

void pile() {
  if (stopFall())
    b.falling = false;
}

void eat() {
  if (!b.falling) { //if the brick stopped
    for (int i=0; i < 4; i++) { //for each square
      maxY[(int)b.sq[i].pos.x/15] -= 15; //increase max height for the column which contains this square
      lines[(int)b.sq[i].pos.y/15][(int)b.sq[i].pos.x/15] = new Square(b.sq[i], b.c); //add square to environnement
    }
    b = new Brick(30, (int)random(5));
  }
}

void clearLine() {
  boolean full;
  for (int i=0; i < height/15; i++) {
    full = true;
    for (int j=0; j < width/15; j++) {
      if (lines[i][j] == null)
        full = false;
    }
    
    if (full)
      shiftDown(i);
  }
}


void shiftDown(int ind) {
  for (int i=ind; i > 0; i--) {
    lines[i] = lines[i-1];
    for (int j=0; j < width/15; j++) {
      if (lines[i][j] != null)
        lines [i][j].pos.y -= 15;  
    }
  }
  lines[0] = new Square[width/15];
}


boolean wallLeft() {
  for (int i=0; i < 4; i++) {
     if (b.sq[i].pos.x == 0)
       return true;
     if (lines[(int)b.sq[i].pos.y/15][(int)b.sq[i].pos.x/15-1] != null)
       return true;
  }
  return false;
}

boolean wallRight() {
  for (int i=0; i < 4; i++) {
     if (b.sq[i].pos.x == width-15)
       return true;
     if (lines[(int)b.sq[i].pos.y/15][(int)b.sq[i].pos.x/15+1] != null)
       return true;
  }
  return false;
}


boolean stopFall() {
  for (int i=0; i < 4; i++) {
     if (b.sq[i].pos.y == height-15 || lines[(int)b.sq[i].pos.y/15+1][(int)b.sq[i].pos.x/15] != null || b.sq[i].pos.y == maxY[(int)b.sq[i].pos.x/15] && lines[(int)b.sq[i].pos.y/15+1][(int)b.sq[i].pos.x/15] != null) //if (pos.y = bottom OR pos.y == maxY AND square beneath you is null
       return true;
  }
  return false;
  
}

void keyPressed() {
  if (keyCode == UP) {
    b.spin();
    b.draw();
  }
  
  if (keyCode == DOWN) {
    b.fspeed = 2;
  }
  
  if (keyCode == LEFT) {
    if (!wallLeft())
      b.moveLeft(); 
    keyCode = 0;
  }
  
  if (keyCode == RIGHT) {
    if (!wallRight())
      b.moveRight();
    keyCode = 0;
  }
}

void keyReleased() {
  if (keyCode == DOWN) {
    b.fspeed = b.speed;
    b.frame = 0;
  }

}