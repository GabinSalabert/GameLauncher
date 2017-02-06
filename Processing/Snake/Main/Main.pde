import org.dishevelled.processing.frames.*;


// Declare all we need as variable \\

int head[] = new int[2];
int head2[] = new int[2];

int item[] = new int[2];

int bodyLength = 2;//first length, at the beginning
int bodyLength2 = 2;
int dir = 0, dir2 = 0, score = 0, score2 = 0, state = 0, unJoueur = 0, deuxJoueur = 0, m;

Body body[] = new Body[5000]; //Max length for snake
Body body2[] = new Body[5000];

Button buttonExit = new Button(100, 320, 120, 50);
Button buttonRetry = new Button(500, 320, 120, 50);
Button buttonSolo = new Button(100, 320, 120, 50);
Button buttonDuo = new Button(500, 320, 120, 50);

boolean over = false; //False value until game's end
boolean turn = false; //A little bug if you hit 2 keys in the same time, the snakes makes a half turn
boolean turn2 = false;
boolean loose1 = false;
boolean loose2 = false;

PImage img, img2;







// Create the window and initialize positions, font-family, FPS.. \\

void setup() {
  size(728, 481); //Window's size (+1 for edges)

  //Snake's head position
  head[0] = int(width/20);
  head[1] = int(height/20);
  head2[0] = int(width/15);
  head2[1] = int(height/15);

  //item's position
  item[0] = int(random(width/10));
  item[1] = int(random(height/10));

  //Snake's body positions
  body[0] = new Body(head[0], head[1]+1); //Obligatory else it's over
  body[1] = new Body(head[0], head[1]+2); //Obligatory else it's over
  body2[0] = new Body(head2[0], head2[1]+1); 
  body2[1] = new Body(head2[0], head2[1]+2);

  textFont(createFont("Time New Roman", 30)); //Choose a font-family
  textAlign(CENTER, CENTER); //Choose where you want it

  img = loadImage("Ban4.jpg");
  img2 = loadImage("Snake.jpeg");

  frameRate(12); //FPS
}









// Specific tests to catch events and which key is hit

void keyPressed() { //Direction in case of event
  if (!over && !turn) {
    turn = true;
    if (keyCode == 38 && (dir == 1 || dir == 3)) dir = 0; //Top
    if (keyCode == 40 && (dir == 1 || dir == 3)) dir = 2; //Bottom
    if (keyCode == 37 && (dir == 0 || dir == 2)) dir = 3; //Left
    if (keyCode == 39 && (dir == 0 || dir == 2)) dir = 1; //Rigth
  }
  if (!over && !turn2) {
    turn2 = true;
    if (key == 'z' && (dir2 == 1 || dir2 == 3)) dir2 = 0; //Top
    if (key == 's' && (dir2 == 1 || dir2 == 3)) dir2 = 2; //Bottom
    if (key == 'q' && (dir2 == 0 || dir2 == 2)) dir2 = 3; //Left
    if (key == 'd' && (dir2 == 0 || dir2 == 2)) dir2 = 1; //Rigth
  }
}










// Lauch the game, draw all we want (snake, item..) and allows moves. Also do some test for the game's end \\

void draw() {
  int i, j;

  //Create the canva
  if (unJoueur == 0 && deuxJoueur == 0) {
    image(img2, 0, 0, width, height);
    stroke(150);
    rect(0, 0, width, 94);
    image(img, 0, 3);
    buttonSolo.drawBs();
    buttonDuo.drawBd();
    unJoueur = buttonSolo.playS();
    deuxJoueur = buttonDuo.playD();
  }



  //Mode Solo

  if (unJoueur == 1) {  
    background(0);
    fill(30); //Grey color for grid
    noStroke(); 
    for (i=0; i < 73; i++) { //Browse Width
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
      if (body[i].getX() == head[0] && body[i].getY() == head[1]) over = true; //If the snake eats himself, it's lost
    }

    if (!over) {

      for (int k = bodyLength-1; k > 0; k--) { //Browse the body but upside down and without the head. The body has to follow the head
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

      if (head[0] == -1 || head[0] == 73 || head[1] == -1 || head[1] == 48) over = true;

      fill(255); 
      text("Score : "+score, width/2, 10); //Write the message
    } else {

      fill(0, 200);
      rect(0, 0, width, height);
      fill(255); //Dark shadow

      //Write the message after loosing
      if (score < 10) { 
        fill(150, 150, 150);
        text("Score : "+score + "\nYou're soooo bad, try again bro'..", width/2, height/3);
      } else if (score >= 10 && score < 20) { 
        fill(150, 150, 150);
        text("Score : "+score + "\nNot bad dude,\n but not enough to impress me..", width/2, height/3);
      } else if (score >= 20) { 
        fill(150, 150, 150);
        text("Score : "+score + "\nWow! Well, I think I can say that : ggwp!", width/2, height/3);
      }

      //Draw the button Quit
      buttonExit.drawBe();
      buttonRetry.drawBr();
      buttonExit.quit();  
      buttonRetry.quit();
    }

    turn = false;
  }





  //Mode Duo

  if (deuxJoueur == 2) {  
    background(0);
    fill(30); //Grey color for grid
    noStroke(); 
    for (i=0; i < 73; i++) { //Browse Width
      for (j=0; j < 48; j++) { //Browse Height
        rect(i*10+1, j*10+1, 9, 9); //Create the grid //"9" else last squares will be on the edge
      }
    }

    fill(0, 0, 255); //Blue color
    ellipse(item[0]*10+5.5, item[1]*10+5.5, 9, 9); //Float numbers because we want the case's center for the ellipse

    fill(255, 0, 0); //Red color
    rect(head[0]*10+1, head[1]*10+1, 9, 9); //Draw snake's head
    fill(0, 255, 0);
    rect(head2[0]*10+1, head2[1]*10+1, 9, 9); //Draw snake's head

    fill(255, 255, 0); //Yellow colors
    for (i=0; i < bodyLength; i++) { //Browse the snale's body
      rect(body[i].getX()*10+1, body[i].getY()*10+1, 9, 9); //Draw snake's body
      if (body[i].getX() == head[0] && body[i].getY() == head[1]) over = true; //If the snake eats himself, it's lost
      for (m=0; m < bodyLength2; m++){
        if (body2[m].getX() == head[0] && body2[m].getY() == head[1]){
          over = true; 
          loose1 = true;
        }
      }
    }
    fill(0, 255, 255); 
    for (m=0; m < bodyLength2; m++) { //Browse the snale's body
      rect(body2[m].getX()*10+1, body2[m].getY()*10+1, 9, 9); //Draw snake's body
      if (body2[m].getX() == head2[0] && body2[m].getY() == head2[1]) over = true; //If the snake eats himself, it's lost
      for (i=0; i < bodyLength; i++){
        if (body[i].getX() == head2[0] && body[i ].getY() == head2[1]){
        over = true; 
        loose2 = true;
        }
      }
    }

    if (!over) {

      for (int k = bodyLength-1; k > 0; k--) { //Browse the body but upside down and without the head. The body has to follow the head
        body[k].setX(body[k-1].getX()); //Set the body[i] position with the body[i-1] position (x)
        body[k].setY(body[k-1].getY()); //Set the body[i] position with the body[i-1] position (y)
      }
      for (int l = bodyLength2-1; l > 0; l--) { //Browse the body but upside down and without the head. The body has to follow the head
        body2[l].setX(body2[l-1].getX()); //Set the body[i] position with the body[i-1] position (x)
        body2[l].setY(body2[l-1].getY()); //Set the body[i] position with the body[i-1] position (y)
      }

      body[0].setX(head[0]); //Set the body's first part with the head position (x) 
      body[0].setY(head[1]); //Set the body's first part with the head position (x)
      body2[0].setX(head2[0]);
      body2[0].setY(head2[1]);

      if (dir == 0) head[1] --; //Move head towards top
      else if (dir == 1) head[0] ++; //Move head towards rigth
      else if (dir == 2) head[1] ++; //Move head towards bottom
      else head[0] --; //Move head towards left

      if (dir2 == 0) head2[1] --; //Move head towards top
      else if (dir2 == 1) head2[0] ++; //Move head towards rigth
      else if (dir2 == 2) head2[1] ++; //Move head towards bottom
      else head2[0] --; //Move head towards left

      if (head[0] == item[0] && head[1] == item[1]) {
        score++;
        item[0] = int(random(width/10));
        item[1] = int(random(height/10));
        body[bodyLength] = new Body(body[bodyLength-1].getX(), body[bodyLength-1].getY()); //Create a new part in the snake's body, placed at the end
        bodyLength ++; //Don't forget to increment the snake's size in this case
      }
      if (head2[0] == item[0] && head2[1] == item[1]) {
        score2++;
        item[0] = int(random(width/10));
        item[1] = int(random(height/10));
        body2[bodyLength] = new Body(body2[bodyLength-1].getX(), body2[bodyLength-1].getY()); //Create a new part in the snake's body, placed at the end
        bodyLength2 ++; //Don't forget to increment the snake's size in this case
      }

      if (head[0] == -1 || head[0] == 72 || head[1] == -1 || head[1] == 48) {
        over = true;
        loose1 = true;
      }
      if (head2[0] == -1 || head2[0] == 72 || head2[1] == -1 || head2[1] == 48) {
        over = true;
        loose2 = true;
      }


      fill(255); 
      text("Score : "+score, width/3, 10); //Write the message
      text("Score : "+score2, width/1.5, 10); //Write the message
    } else {

      fill(0, 200);
      rect(0, 0, width, height);
      fill(255); //Dark shadow

      //Write the message after loosing
      if (loose1) { 
        fill(150, 150, 150);
        text("Score Joueur 1 : "+score + "\nScore Joueur 2 : "+score2 + "\nThe winner is Joueur : 2.", width/2, height/3);
      }
      if (loose2) { 
        fill(150, 150, 150);
        text("Score Joueur 1 : "+score + "\nScore Joueur 2 : "+score2 + "\nThe winner is Joueur : 1.", width/2, height/3);
      }

      //Draw the button Quit
      buttonExit.drawBe();
      buttonRetry.drawBr();
      buttonExit.quit();  
      buttonRetry.quit();
    }

    turn = false;
    turn2 = false;
  }
}