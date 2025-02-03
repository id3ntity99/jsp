package sub1;

import java.io.IOException;
import jakarta.servlet.jsp.JspWriter;

public class Account {
  private String bank;
  private String id;
  private String name;
  private int balance;

  public Account(String bank, String id, String name, int balance) {
    this.bank = bank;
    this.id = id;
    this.name = name;
    this.balance = balance;
  }

  public void deposit(int amount) {
    this.balance += amount;
  }

  public void withdraw(int amount) {
    this.balance -= amount;
  }

  public void print(JspWriter out) throws IOException {
    String s = String.format("<p>" + "은행명: %s%n" + "</br>" + "계좌번호: %s%n" + "</br>" + "입금주: %s%n"
        + "</br>" + "잔고: %d%n" + "</p", this.bank, this.id, this.name, this.balance);
    out.println(s);
  }
}
