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


	private Main main;

	public ControllerMainMenu(){

	}

	public void setMain (Main main) {
		this.main = main;
	} 

	@FXML
	public void synopSnake(ActionEvent e) {
		synopsis.setText("yoloswag");	
	}

	@FXML
	public void synopTetris(ActionEvent e) {
		synopsis.setText("swagyolo");
	}
}


/*	<Button text="Sign in"
		onAction="#HandleLoginAction"/>*/