package kr.co.jboard.dao;

public final class Query {
  public static final String INSERT_ARTICLE = "INSERT INTO `Article` VALUES(?,?,?,?,?,?,?,?,?,?);";
  public static final String SELECT_ARTICLE = "SELECT * FROM `Article` WHERE `no`=?;";

  public static final String SELECT_TERMS = "SELECT * FROM `Terms` WHERE `no`=?;";
  public static final String SELECT_ALL_TERMS = "SELECT * FROM `Terms`;";
  public static final String INSERT_TERMS = "INSERT INTO `Terms` VALUES(?, ?, ?);";
  public static final String UPDATE_TERMS =
      "UPDATE `Terms` SET `terms`=?, `privacy`=? WHERE `no`=?;";
  public static final String DELETE_TERMS = "DELETE FROM `Terms` WHERE `no`=?;";

  public static final String INSERT_USER =
      "INSERT INTO `User` SET `uid`=?, `pass`=SHA2(?, 256), `name`=?, `nick`=?, `email`=?, `hp`=?, `zip`=?, `addr1`=?, `addr2`=?, `regip`=?, `regDate`=NOW();";
  public static final String SELECT_USER =
      "SELECT * FROM `User` WHERE `uid`=? AND `pass`= SHA2(?, 256);";
  public static final String SELECT_ALL_USER = "SELECT * FROM `User`;";
  public static final String UPDATE_USER =
      "UPDATE `User` SET `pass`=SHA2(?, 256), `name`=?, `nick`=?, `email`=?, `hp`=?, `role`=?, `zip`=?, `addr1`=?, `addr2`=? WHERE `uid`=?;";
  public static final String DELETE_USER =
      "DELETE FROM `User` WHERE `uid`=? AND `pass`=SHA2(?, 256);";

  private Query() {
    // Empty constructor;
  }
}
