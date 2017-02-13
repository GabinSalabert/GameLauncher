package launcher;

import javafx.fxml.FXML;
import javafx.scene.text.Text;
import javafx.event.ActionEvent;
import javafx.scene.control.TextArea;
import javafx.fxml.Initializable;

public class ControllerMainMenu {
	
	//@FXML private Button snakeBtn;
	//@FXML private Button tetrisBtn;
	@FXML private TextArea synopsis;
	@FXML private TextArea titre;


	private Main main;

	public ControllerMainMenu(){

	}

	public void setMain (Main main) {
		this.main = main;
	} 

	@FXML
	public void synopSnake(ActionEvent e) {
		synopsis.setText("Snake is the common name for a videogame concept where the player maneuvers a line which grows in length, with the line itself being a primary obstacle. The concept originated in the 1976 arcade game Blockade, and the ease of implementing Snake has led to hundreds of versions (some of which have the word snake or worm in the title) for many platforms. There are over 300 for iOS alone. The player controls a dot, square, or object on a bordered plane.  As it moves forward, it leaves a trail behind, resembling a moving snake. In some games, the end of the trail is in a fixed position, so the snake continually gets longer as it moves. In another common scheme, the snake has a specific length, so there is a moving tail a fixed number of units away from the head. The player loses when the snake runs into the screen border, a trail, or another obstacle.");	
		titre.setText("Snake !");
	}

	@FXML
	public void synopTetris(ActionEvent e) {
		synopsis.setText("'Tetriminos' are game pieces shaped like tetrominoes, geometric shapes composed of four square blocks each. A random sequence of Tetriminos fall down the playing field (a rectangular vertical shaft, called the 'well' or 'matrix'). The objective of the game is to manipulate these Tetriminos, by moving each one sideways (if the player feels the need) and rotating it by 90 degree units, with the aim of creating a horizontal line of ten units without gaps. When such a line is created, it disappears, and any block above the deleted line will fall. When a certain number of lines are cleared, the game enters a new level. As the game progresses, each level causes the Tetriminos to fall faster, and the game ends when the stack of Tetriminos reaches the top of the playing field and no new Tetriminos are able to enter. Some games also end after a finite number of levels or lines.");
		titre.setText("Tétris !");
	}

}


/*	<Button text="Sign in"
		onAction="#HandleLoginAction"/>*/