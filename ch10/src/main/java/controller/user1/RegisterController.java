package controller.user1;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Logger;
import controller.user1.dto.User1DTO;
import controller.user1.service.User1Service;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user1/register.do")
public class RegisterController extends HttpServlet {
  private static final Logger LOGGER = Logger.getLogger(RegisterController.class.getName());
  private static final long serialVersionUID = UUID.randomUUID().version();

  private User1Service service = User1Service.getInstance();

  public RegisterController() {
    // Empty constructor
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user1/register.jsp");
    dispatcher.forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String uid = req.getParameter("uid");
    String name = req.getParameter("name");
    String hp = req.getParameter("hp");
    String age = req.getParameter("age");

    // Instantiate DTO
    User1DTO dto = new User1DTO();
    dto.setUid(uid);
    dto.setName(name);
    dto.setHp(hp);
    dto.setAge(age);

    try {
      service.create(dto);
    } catch (SQLException e) {
      // TODO: Send errornous response
    }

    resp.sendRedirect("/ch10/user1/list.do");
  }
}
