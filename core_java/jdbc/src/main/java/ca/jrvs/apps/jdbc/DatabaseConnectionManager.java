package ca.jrvs.apps.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnectionManager {
  private final String url;
  private final Properties protperties;

  public DatabaseConnectionManager(String host, String databaseName, String username, String password) {
    this.url = "jdbc:postgresql://" +host+"/"+databaseName;
    this.protperties = new Properties();
    this.protperties.setProperty("user", username);
    this.protperties.setProperty("password", password);
  }

  public Connection getConnection() throws SQLException{
    return DriverManager.getConnection(this.url, this.protperties);
  }

}
