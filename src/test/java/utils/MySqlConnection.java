package utils;

import net.minidev.json.JSONObject;
import net.minidev.json.parser.JSONParser;
import net.minidev.json.parser.ParseException;

import java.sql.*;

public class MySqlConnection {

    public static JSONObject getTutorialByBD(int id){
        String jsonTutorial = "";
        try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb" +
                "?allowPublicKeyRetrieval=true&useSSL=false&user=usuario&password=123456");
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM tbl_tutorials where id = ?")){
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            jsonTutorial = "{" +
                    "\"id\":" + resultSet.getInt("id") +
                    ",\"title\": \""+ resultSet.getString("title") + "\"," +
                    ",\"description\": \""+ resultSet.getString("description") + "\"," +
                    ",\"published\": "+ resultSet.getBoolean("published") +
                    "}";
            JSONParser parser = new JSONParser(JSONParser.MODE_JSON_SIMPLE);
            return (JSONObject)parser.parse(jsonTutorial);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
