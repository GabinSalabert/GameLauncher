package launcher;

import javafx.fxml.FXML;
import javafx.scene.text.Text;
import javafx.event.ActionEvent;


public class ControllerMainMenu {
	
	@FXML private Button snakeBtn;
	@FXML private Button tetrisBtn;


	private Main main;

	public ControllerMainMenu(){

	}

	public void setMain (Main main) {
		this.main = main;
	} 

	@FXML
	public void synopSnake(ActionEvent e) {
		return;
	}

	@FXML
	public void synopTetris(ActionEvent e) {
		return;
	}
}


/*	<Button text="Sign in"
		onAction="#HandleLoginAction"/>*/