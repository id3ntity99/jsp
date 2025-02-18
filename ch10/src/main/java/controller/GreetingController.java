package controller;

import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/greeting.do")
public class GreetingController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  public GreetingController() {
    // Empty constructor
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // Forward view
    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/greeting.jsp");
    dispatcher.forward(req, resp);

  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {}
}
