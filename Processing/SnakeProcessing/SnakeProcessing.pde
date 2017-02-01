 //<>//
import processing.video.*; 
import org.dishevelled.processing.frames.*;
import controlP5.*;

int head[] = new int[2];
int item[] = new int[2];

int bodyLength = 2; //first length, at the beginning
int dir = 0, score = 0;

Body body[] = new Body[5000]; //Max length for snake

boolean over = false; //False value until game's end
boolean turn = false; //A little bug if you hit 2 keys in the same time, the snakes makes a half turn


void setup() {
  size(641, 481); //Window's size (+1 for edges)

  //Snake's head position
  head[0] = int(width/20);
  head[1] = int(height/20);

  //item's position
  item[0] = int(random(width/10));
  item[1] = int(random(height/10));

  //Snake's body position
  body[0] = new Body(head[0], head[1]+1); //Obligatory else it's over
  body[1] = new Body(head[0], head[1]+2); //Obligatory else it's over

  textFont(createFont("Time New Roman", 30)); //Choose a font-family
  textAlign(CENTER, CENTER); //Choose where you want it

  frameRate(10); //FPS
}

void keyPressed() { //Direction in case of event
  if (!over && !turn) {
    turn = true;
    if (keyCode == 38 && (dir == 1 || dir == 3)) dir = 0; //Top
    if (keyCode == 40 && (dir == 1 || dir == 3)) dir = 2; //Bottom
    if (keyCode == 37 && (dir == 0 || dir == 2)) dir = 3; //Left
    if (keyCode == 39 && (dir == 0 || dir == 2)) dir = 1; //Rigth
  }
}

void draw() {
  int i, j;

  //Create the canva
  background(0);
  fill(30); //Grey color for grid
  noStroke(); 
  for (i=0; i < 64; i++) { //Browse Width
    for (j=0; j < 48; j++) { //Browse Height
      rect(i*10+1, j*10+1, 9, 9); //Create the grid //"9" else last squares will be on the edge
    }
  }

  fill(0, 0, 255); //Blue color
  ellipse(item[0]*10+5.5, item[1]*10+5.5, 9, 9); //Float numbers because we want the case's center for the ellipse

  fill(255, 0, 0); //Red color
  rect(head[0]*10+1, head[1]*10+1, 9, 9); //Draw snake's head

  fill(255, 255, 0); //Yellow colors
  for (i=0; i < bodyLength; i++) { //Browse the snale's body
    rect(body[i].getX()*10+1, body[i].getY()*10+1, 9, 9); //Draw snake's body
    if(body[i].getX() == head[0] && body[i].getY() == head[1]) over = true; //If the snake eats himself, it's lost
  }

  if (!over) {

    for (int k = bodyLength-1; k > 0; k--) { //Browse the body but upside down and without the head. The body have to follow the head
      body[k].setX(body[k-1].getX()); //Set the body[i] position with the body[i-1] position (x)
      body[k].setY(body[k-1].getY()); //Set the body[i] position with the body[i-1] position (y)
    }

    body[0].setX(head[0]); //Set the body's first part with the head position (x) 
    body[0].setY(head[1]); //Set the body's first part with the head position (x)

    if (dir == 0) head[1] --; //Move head towards top
    else if (dir == 1) head[0] ++; //Move head towards rigth
    else if (dir == 2) head[1] ++; //Move head towards bottom
    else head[0] --; //Move head towards left

    if (head[0] == item[0] && head[1] == item[1]) {
      score++;
      item[0] = int(random(width/10));
      item[1] = int(random(height/10));
      body[bodyLength] = new Body(body[bodyLength-1].getX(), body[bodyLength-1].getY()); //Create a new part in the snake's body, placed at the end
      bodyLength ++; //Don't forget to increment the snake's size in this case
    }

    if (head[0] == -1 || head[0] == 64 || head[1] == -1 || head[1] == 48) over = true;

    fill(255); 
    text("Score : "+score, width/2, 10); //Write the message
  } 
  
  else {
    fill(0, 200);
    rect(0, 0, width, height);
    fill(255); //Dark shadow
    
    //Write the message after loosing
    if (score < 10) text("Score : "+score + "\nYou're soooo bad, try again bro'..", width/2, height/2); 
    else if (score >= 10 && score < 20) text("Score : "+score + "\nNot bad dude, but not enough to impress me..", width/2, height/2);
    else if (score >= 20) text("Score : "+score + "\nWow! Well, I think I can say that : ggwp!", width/2, height/2);
  }

  turn = false;
}

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