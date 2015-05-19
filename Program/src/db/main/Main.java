package db.main;

import java.sql.*;
import java.sql.Statement;
import java.sql.PreparedStatement;


/**
 * Created by Yarik on 20.05.2015.
 */
public class Main {

    public static void main(String[] args) {
        String URL = "jdbc:postgresql://localhost:5432/AutoPark";
        try {
            Connection dbConnect = DriverManager.getConnection(URL, "postgres", "admin");
            Statement statement = dbConnect.createStatement();
            String equipment = "select * from cashflow";
            ResultSet cash = statement.executeQuery(equipment);
            while(cash.next()) {
                cash.getInt(5);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
