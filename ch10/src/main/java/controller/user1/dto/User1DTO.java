package controller.user1.dto;

public class User1DTO {
  private String uid;
  private String name;
  private String hp;
  private int age;

  public User1DTO() {
    // Empty Constructor
  }

  public User1DTO(String uid, String name, String hp, int age) {
    super();
    this.uid = uid;
    this.name = name;
    this.hp = hp;
    this.age = age;
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

  public void setAge(String age) {
    if (age != null) {
      this.age = Integer.parseInt(age);
    } else {
      this.age = 0;
    }
  }

  @Override
  public String toString() {
    return "User1DTO [uid=" + uid + ", name=" + name + ", hp=" + hp + ", age=" + age + "]";
  }

}
