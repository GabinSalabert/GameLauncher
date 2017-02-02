package launcher;

import javafx.fxml.FXML;
import javafx.scene.text.Text;



public class ControllerMainMenu {
	
	@FXML private Text actiontarget;

	private Main main;

	public ControllerMainMenu(){

	}

	public void setMain (Main main) {
		this.main = main;
	} 

	public void HandleLoginAction() {
		actiontarget.setText("you pressed da button");
	}
}