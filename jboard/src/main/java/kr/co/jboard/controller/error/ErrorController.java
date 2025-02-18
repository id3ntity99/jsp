package kr.co.jboard.controller.error;

import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/error.do")
public class ErrorController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    int statusCode = Integer.parseInt(req.getParameter("code"));
    RequestDispatcher dp = req.getRequestDispatcher("/");
    switch (statusCode) {
      case HttpServletResponse.SC_BAD_REQUEST: {
        req.setAttribute("statusCode", statusCode);
        req.setAttribute("statusCodeMessage", "Bad Request");
        break;
      }
      case HttpServletResponse.SC_INTERNAL_SERVER_ERROR: {
        req.setAttribute("statusCode", statusCode);
        req.setAttribute("statusCodeMessage", "Internal Server Error");
      }
      default:
        break;
    }
    dp.forward(req, resp);
  }
}
