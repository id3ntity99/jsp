package kr.co.jboard.service;

import java.sql.SQLException;
import java.util.List;
import kr.co.jboard.dao.UserDAO;
import kr.co.jboard.dto.UserDTO;

public class UserService {
  private static final UserService INSTANCE = new UserService();

  public static UserService getInstance() {
    return INSTANCE;
  }

  private UserDAO dao = UserDAO.getInstance();

  private UserService() {
    // Empty constructor
  }

  public void register(UserDTO dto) throws SQLException {
    dao.insert(dto);
  }

  public UserDTO find(UserDTO dto) throws SQLException {
    return dao.select(dto);
  }

  public List<UserDTO> findAll() throws SQLException {
    return dao.selectAll();
  }

  public void modify(UserDTO dto) throws SQLException {
    dao.update(dto);
  }

  public void delete(UserDTO dto) throws SQLException {
    dao.delete(dto);
  }
}
