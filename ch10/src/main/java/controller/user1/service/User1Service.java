package controller.user1.service;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;
import controller.user1.dao.User1DAO;
import controller.user1.dto.User1DTO;

public class User1Service {
  private static final Logger LOGGER = Logger.getLogger(User1Service.class.getName());
  private static final User1Service INSTANCE = new User1Service();

  public static User1Service getInstance() {
    return INSTANCE;
  }

  private User1DAO dao = User1DAO.getInstance();

  public User1Service() {
    // Empty constructor
  }

  public void create(User1DTO dto) throws SQLException {
    dao.insertUser1(dto);
  }

  public User1DTO search(String uid) throws SQLException {
    return dao.selectUser1(uid);
  }

  public List<User1DTO> list() throws SQLException {
    return dao.selectUser1All();
  }

  public void modify(User1DTO dto) throws SQLException {
    dao.updateUser1(dto);
  }

  public void delete(String uid) throws SQLException {
    dao.deleteUser1(uid);
  }
}
