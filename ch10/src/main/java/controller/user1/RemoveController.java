package controller.user1;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Logger;
import controller.user1.service.User1Service;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user1/remove.do")
public class RemoveController extends HttpServlet {
  private static final Logger LOGGER = Logger.getLogger(RemoveController.class.getName());
  private static final long serialVersionUID = UUID.randomUUID().version();

  private User1Service service = User1Service.getInstance();

  public RemoveController() {
    // Empty constructor
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String uid = req.getParameter("uid");

    try {
      service.delete(uid);
    } catch (SQLException e) {
      // TODO: handle exception
    }

    resp.sendRedirect("/ch10/user1/list.do");
  }
}
