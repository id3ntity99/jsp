package sub1;

public class User {
  private String uid;
  private String name;
  private String hp;
  private String age;

  public User() {}

  public User(String uid, String name, String hp, String age) {
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

  public String getAge() {
    return age;
  }

  public void setAge(String age) {
    this.age = age;
  }

  @Override
  public String toString() {
    return "User [uid=" + uid + ", name=" + name + ", hp=" + hp + ", age=" + age + "]";
  }


}
