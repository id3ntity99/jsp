package controller.user1;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import controller.user1.dto.User1DTO;
import controller.user1.service.User1Service;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user1/list.do")
public class ListController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();
  private static final User1Service service = User1Service.getInstance();

  public ListController() {
    // Empty constructor
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      List<User1DTO> users = service.list();

      req.setAttribute("users", users);

      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user1/list.jsp");
      dispatcher.forward(req, resp);
    } catch (SQLException e) {
      // TODO: Send 500 internal server error
    }
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

  }
}
