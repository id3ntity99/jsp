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

@WebServlet("/user1/modify.do")
public class ModifyController extends HttpServlet {
  private static final Logger LOGGER = Logger.getLogger(ModifyController.class.getName());
  private static final long serialVersionUID = UUID.randomUUID().version();
  private final User1Service service = User1Service.getInstance();

  public ModifyController() {
    // Empty constructor
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      String uid = req.getParameter("uid");
      User1DTO dto = service.search(uid);
      if (dto == null) {
        // TODO: Handle when search fails
        LOGGER.warning("There is no user with uid " + uid);
      }
      req.setAttribute("user", dto);
    } catch (SQLException e) {
      e.printStackTrace();
    }

    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user1/modify.jsp");
    dispatcher.forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String uid = req.getParameter("uid");
    String name = req.getParameter("name");
    String hp = req.getParameter("hp");
    String age = req.getParameter("age");

    User1DTO user = new User1DTO(uid, name, hp, Integer.parseInt(age));
    try {
      service.modify(user);
    } catch (SQLException e) {
      // TODO: Send 500 Internal Server Error
      e.printStackTrace();
    }

    resp.sendRedirect("/ch10/user1/list.do");
  }
}
