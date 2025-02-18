package kr.co.jboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import kr.co.jboard.dto.UserDTO;
import kr.co.jboard.util.ConnectionUtil;

public class UserDAO {
  private static final UserDAO INSTANCE = new UserDAO();

  public static UserDAO getInstance() {
    return INSTANCE;
  }

  private UserDAO() {
    // Empty constructor
  }

  public void insert(UserDTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.INSERT_USER);

    psmt.setString(1, dto.getUid());
    psmt.setString(2, dto.getPass());
    psmt.setString(3, dto.getName());
    psmt.setString(4, dto.getNick());
    psmt.setString(5, dto.getEmail());
    psmt.setString(6, dto.getHp());
    psmt.setString(7, dto.getZip());
    psmt.setString(8, dto.getAddr1());
    psmt.setString(9, dto.getAddr2());
    psmt.setString(10, dto.getRegip());

    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }

  public UserDTO select(UserDTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.SELECT_USER);

    psmt.setString(1, dto.getUid());
    psmt.setString(2, dto.getPass());

    ResultSet rs = psmt.executeQuery();

    UserDTO user = null;
    if (rs.next()) {
      user = new UserDTO();
      user.setUid(rs.getString(1));
      user.setPass(rs.getString(2));
      user.setName(rs.getString(3));
      user.setNick(rs.getString(4));
      user.setEmail(rs.getString(5));
      user.setRole(rs.getString(6));
      user.setHp(rs.getString(7));
      user.setZip(rs.getString(8));
      user.setAddr1(rs.getString(9));
      user.setAddr2(rs.getString(10));
      user.setRegip(rs.getString(11));
      user.setRegDate(rs.getString(12));
      user.setLeaveDate(rs.getString(13));
    }
    conn.close();
    psmt.close();
    rs.close();

    return user;
  }

  public List<UserDTO> selectAll() throws SQLException {
    List<UserDTO> users = new ArrayList<>();
    Connection conn = ConnectionUtil.getConnection();
    Statement stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery(Query.SELECT_ALL_USER);

    while (rs.next()) {
      UserDTO user = new UserDTO();
      user.setUid(rs.getString(1));
      user.setPass(rs.getString(2));
      user.setName(rs.getString(3));
      user.setNick(rs.getString(4));
      user.setEmail(rs.getString(5));
      user.setRole(rs.getString(6));
      user.setHp(rs.getString(7));
      user.setZip(rs.getString(8));
      user.setAddr1(rs.getString(9));
      user.setAddr2(rs.getString(10));
      user.setRegip(rs.getString(11));
      user.setRegDate(rs.getString(12));
      user.setLeaveDate(rs.getString(13));

      users.add(user);
    }

    conn.close();
    stmt.close();
    rs.close();
    return users;
  }

  public void update(UserDTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.UPDATE_USER);
    psmt.setString(1, dto.getPass());
    psmt.setString(2, dto.getName());
    psmt.setString(3, dto.getNick());
    psmt.setString(4, dto.getEmail());
    psmt.setString(5, dto.getHp());
    psmt.setString(6, dto.getRole());
    psmt.setString(7, dto.getZip());
    psmt.setString(8, dto.getAddr1());
    psmt.setString(9, dto.getAddr2());
    psmt.setString(10, dto.getUid());

    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }

  public void delete(UserDTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.DELETE_USER);
    psmt.setString(1, dto.getUid());
    psmt.setString(2, dto.getPass());

    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }
}
