package com.example.eventboard.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:postgresql://localhost:5432/eventboard";

    private static final String USER = "postgres";

    private static final String PASSWORD = "7536";

    public static Connection getConnection() {

        try {

            Class.forName("org.postgresql.Driver");

            return DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

        } catch (Exception e) {

            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}