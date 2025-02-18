package listener;

import java.util.concurrent.atomic.AtomicInteger;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

@WebListener
public class SessionListener implements HttpSessionAttributeListener {
  private AtomicInteger count = new AtomicInteger(0);

  @Override
  public void attributeAdded(HttpSessionBindingEvent event) {
    System.out.println("Current users: " + count.getAndIncrement());
  }

  @Override
  public void attributeRemoved(HttpSessionBindingEvent event) {
    System.out.println("Current users: " + count.getAndDecrement());
  }
}
