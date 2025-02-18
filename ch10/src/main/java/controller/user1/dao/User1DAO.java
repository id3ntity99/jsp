package controller.user1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import controller.user1.dto.User1DTO;
import controller.user1.util.ConnectionUtil;
import controller.user1.util.Query;

public class User1DAO {
  private static final Logger LOGGER = Logger.getLogger(User1DAO.class.getName());
  private static final User1DAO INSTANCE = new User1DAO();

  public static User1DAO getInstance() {
    return INSTANCE;
  }

  public User1DAO() {
    // Empty Constructor
  }

  public void insertUser1(User1DTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.INSERT_USER);
    psmt.setString(1, dto.getUid());
    psmt.setString(2, dto.getName());
    psmt.setString(3, dto.getHp());
    psmt.setInt(4, dto.getAge());
    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }

  public User1DTO selectUser1(String uid) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.SELECT_USER);
    psmt.setString(1, uid);
    ResultSet rs = psmt.executeQuery();

    if (rs.next()) {
      String id = rs.getString(1);
      String name = rs.getString(2);
      String hp = rs.getString(3);
      int age = rs.getInt(4);
      return new User1DTO(id, name, hp, age);
    }

    conn.close();
    psmt.close();
    rs.close();
    return null;
  }

  public List<User1DTO> selectUser1All() throws SQLException {
    List<User1DTO> users = new ArrayList<>();
    Connection conn = ConnectionUtil.getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(Query.SELECT_ALL);

    while (rs.next()) {
      User1DTO dto = new User1DTO();
      dto.setUid(rs.getString(1));
      dto.setName(rs.getString(2));
      dto.setHp(rs.getString(3));
      dto.setAge(rs.getString(4));
      users.add(dto);
    }

    conn.close();
    stmt.close();
    rs.close();

    return users;
  }

  public void updateUser1(User1DTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.UPDATE_USER);
    psmt.setString(1, dto.getName());
    psmt.setString(2, dto.getHp());
    psmt.setInt(3, dto.getAge());
    psmt.setString(4, dto.getUid());

    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }

  public void deleteUser1(String uid) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.DELETE_USER);
    psmt.setString(1, uid);
    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }
}
