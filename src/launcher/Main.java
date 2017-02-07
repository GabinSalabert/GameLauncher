package launcher;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;


public class Main extends Application {

    private Stage thestage;
    private FXMLLoader fxml;


    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
        fxml = new FXMLLoader(Main.class.getResource("Controller.fxml"));
        Parent root = fxml.load();

        Scene scene = new Scene(root, 300, 275);
        //scene.getStyleSheets().add(Main.class.getResource("MainMenu.css"))
        stage.setTitle("lul eksdee");
        stage.setScene(scene);
        stage.show();



    }



}