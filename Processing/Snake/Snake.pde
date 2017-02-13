import org.dishevelled.processing.frames.*;
import ddf.minim.*;



Jeu jeu;
AudioPlayer player, player2, player3;
Minim minim;//audio context





// Create the window and initialize positions, font-family, FPS.. \\

void setup() {
  size(728, 481); //Window's size (+1 for edges)
  jeu = new Jeu();

  minim = new Minim(this);
  player = minim.loadFile("Happy-electronic-music.mp3", 2048);
  player2 = minim.loadFile("Casual-friday-electronic-beat-music.mp3", 2048);
  player3 = minim.loadFile("fail-trombone-01.mp3", 2048);

  frameRate(60); //FPS
}











// Specific tests to catch events and which key is hit

void keyPressed() { //Direction in case of event
  if (!jeu.over && !jeu.turn) {
    jeu.turn = true;
    if (keyCode == 38 && (jeu.dir == 1 || jeu.dir == 3)) jeu.dir = 0; //Top
    if (keyCode == 40 && (jeu.dir == 1 || jeu.dir == 3)) jeu.dir = 2; //Bottom
    if (keyCode == 37 && (jeu.dir == 0 || jeu.dir == 2)) jeu.dir = 3; //Left
    if (keyCode == 39 && (jeu.dir == 0 || jeu.dir == 2)) jeu.dir = 1; //Rigth
  }
  if (!jeu.over && !jeu.turn2) {
    jeu.turn2 = true;
    if (key == 'z' && (jeu.dir2 == 1 || jeu.dir2 == 3)) jeu.dir2 = 0; //Top
    if (key == 's' && (jeu.dir2 == 1 || jeu.dir2 == 3)) jeu.dir2 = 2; //Bottom
    if (key == 'q' && (jeu.dir2 == 0 || jeu.dir2 == 2)) jeu.dir2 = 3; //Left
    if (key == 'd' && (jeu.dir2 == 0 || jeu.dir2 == 2)) jeu.dir2 = 1; //Rigth
  }

  if (key == 'm' && jeu.music == true) {
    if (jeu.unJoueur == 0 && jeu.deuxJoueur == 0) {
      player.mute();
    }

    if (jeu.unJoueur == 1 || jeu.deuxJoueur == 2) {
      player2.mute();
    }
    jeu.music = false;
  }

  if (key == 'p' && jeu.music == false) {
    if (jeu.unJoueur == 1 || jeu.deuxJoueur == 2) {
      player2.unmute();
    }
    if (jeu.unJoueur == 0 && jeu.deuxJoueur == 0) {
      player.unmute();
    }
    jeu.music = true;
  }
}







//Draw all we need, 

void draw() {
  jeu.draw();
  if (jeu.retry == 42) {
    jeu = new Jeu();
    println(jeu.unJoueur);
    println(jeu.deuxJoueur);
    println(jeu.retry);
  }
}