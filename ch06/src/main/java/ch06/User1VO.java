package ch06;

public class User1VO {
  private String uid;
  private String name;
  private String hp;
  private int age;

  public User1VO() {
    String s = "SELECT " + "    o.orderNo," + "    p.prodName," + "    o.orderCount,"
        + "    p.company," + "    c.name," + "    c.hp," + "    o.orderDate " + "FROM `order` AS o "
        + "JOIN `product` AS p ON o.orderProduct = p.prodNo "
        + "JOIN `customer` AS c ON o.orderId = c.custId;";
    // Empty Constructor
  }

  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getHp() {
    return hp;
  }

  public void setHp(String hp) {
    this.hp = hp;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  @Override
  public String toString() {
    return "User [uid=" + uid + ", name=" + name + ", hp=" + hp + ", age=" + age + "]";
  }
}
