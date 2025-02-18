package controller;

import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hello.do")
public class HelloController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  public HelloController() {
    // Empty constructor
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // Forward view
    String msg = String.format(
        "Delegating processing a request [HashCode = %d] came from [SessionID = %s] to hello.jsp",
        req.hashCode(), req.getSession().getId());
    // Delegate processing a request to hello.jsp
    log(msg);
    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/hello.jsp");
    dispatcher.forward(req, resp);

  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {}
}
