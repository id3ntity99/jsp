package controller.user1.util;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionUtil {
  private static final DataSource ds;

  static {
    try {
      Context initCtx = new InitialContext();
      Context ctx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) ctx.lookup("jdbc/user");
    } catch (NamingException e) {
      throw new ExceptionInInitializerError(e);
    }
  }

  private ConnectionUtil() {
    // Utility class that creates connection pool. No constructor
  }

  public static Connection getConnection() throws SQLException {
    return ds.getConnection();
  }
}
