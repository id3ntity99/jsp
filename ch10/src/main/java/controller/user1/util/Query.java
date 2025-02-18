package controller.user1.util;

public class Query {
  public static final String INSERT_USER = "INSERT INTO `user1` VALUES (?, ?, ?, ?);";
  public static final String SELECT_USER = "SELECT * FROM `user1` WHERE `uid`=?;";
  public static final String SELECT_ALL = "SELECT * FROM `user1`;";
  public static final String UPDATE_USER =
      "UPDATE `user1` SET `user_name`=?, `phone_num`=?, `age`=? WHERE `uid`=?;";
  public static final String DELETE_USER = "DELETE FROM `user1` WHERE `uid`=?;";

  private Query() {
    // Empty constructor.
  }
}
