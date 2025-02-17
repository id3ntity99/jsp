package kr.co.jboard.dto;

public class CommentDTO {
  private int cno;
  private int parent;
  private String content;
  private String writer;
  private String regIp;
  private String wdate;

  public CommentDTO() {
    // Empty constructor
  }

  public int getCno() {
    return cno;
  }

  public void setCno(int cno) {
    this.cno = cno;
  }

  public int getParent() {
    return parent;
  }

  public void setParent(int parent) {
    this.parent = parent;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getWriter() {
    return writer;
  }

  public void setWriter(String writer) {
    this.writer = writer;
  }

  public String getRegIp() {
    return regIp;
  }

  public void setRegIp(String regIp) {
    this.regIp = regIp;
  }

  public String getWdate() {
    return wdate;
  }

  public void setWdate(String wdate) {
    this.wdate = wdate;
  }

  @Override
  public String toString() {
    return "CommentDTO [cno=" + cno + ", parent=" + parent + ", content=" + content + ", writer="
        + writer + ", regIp=" + regIp + ", wdate=" + wdate + "]";
  }
}
