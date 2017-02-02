import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;


public class Main extends Application {

    private Stage thestage;


    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
        try {
            Parent root = FXMLLoader.load(getClass().getResource("ControllerMainMenu.fxml"));
        }
        catch {
            System.out.println(failed);
        }
        Scene scene = new Scene(root, 300, 275);

        stage.setTitle("lul eksdee");
        stage.setScene(scene);
        stage.show();



    }



}