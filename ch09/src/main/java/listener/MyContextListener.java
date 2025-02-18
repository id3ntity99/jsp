package listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

/**
 * This class listens to an event that the WAS(Web Application Server, TomCat) terminates itself
 */
public class MyContextListener implements ServletContextListener {
  public MyContextListener() {
    // Empty constructor
  }

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    System.out.println("MyContextListener.contextInitialized() has been called");
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) {
    System.out.println("MyContextListener.contextDestroyed() has been called");
  }
}
