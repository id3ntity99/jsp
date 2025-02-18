package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  public Hello() {
    // Empty constructor
  }

  /**
   * This method is called when the Servlet container loads Hello.class, which is a Servlet
   * 
   */
  @Override
  public void init() throws ServletException {
    log("Hello.init() method has been called");
  }


  /**
   * This method is called when the Servlet container receives HTTP GET request.
   */
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // TODO Check if the header contains key-value of (Attached, AttachHeaderFilter.class)
    log("Hello.doGet() method has been called");
    // Print HTML
    resp.setContentType("text/html;charset=utf-8");
    PrintWriter writer = resp.getWriter();
    writer.println("<html>");
    writer.println("<head>");
    writer.println("<meta charset='UTF-8'/>");
    writer.println("<title>Hello</title>");
    writer.println("</head>");
    writer.println("<body>");
    writer.println("<h3>Hello Servlet</h3>");
    writer.println("<a href='/ch09/hello.do'>Hello</a>");
    writer.println("<a href='/ch09/welcome.do'>Welcome</a>");
    writer.println("<a href='/ch09/greeting.do'>Greeting</a>");
    writer.println("</body>");
    writer.println("</html>");
  }


  /**
   * This method is called when the Servlet container receives HTTP POST request
   */
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    log("Hello.doPost() method has been called");
  }


  /**
   * This method is called after all service calls have been completed.
   */
  @Override
  public void destroy() {
    log("Hello.destroy() method has been called...");
  }
}
