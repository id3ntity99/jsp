package ch06;

public class OrderVO {
  private int orderNo;
  private String orderId;
  private int orderProduct;
  private int orderCount;
  private String orderDate;
  private ProductVO product;
  private CustomerVO customer;

  public OrderVO() {

  }

  public int getOrderNo() {
    return orderNo;
  }

  public void setOrderNo(int orderNo) {
    this.orderNo = orderNo;
  }

  public String getOrderId() {
    return orderId;
  }

  public void setOrderId(String orderId) {
    this.orderId = orderId;
  }

  public int getOrderProduct() {
    return orderProduct;
  }

  public void setOrderProduct(int orderProduct) {
    this.orderProduct = orderProduct;
  }

  public int getOrderCount() {
    return orderCount;
  }

  public void setOrderCount(int orderCount) {
    this.orderCount = orderCount;
  }

  public String getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(String orderDate) {
    this.orderDate = orderDate;
  }

  public ProductVO getProduct() {
    return product;
  }

  public void setProduct(ProductVO product) {
    this.product = product;
  }


  public CustomerVO getCustomer() {
    return customer;
  }

  public void setCustomer(CustomerVO customer) {
    this.customer = customer;
  }

  @Override
  public String toString() {
    return "OrderVO [orderNo=" + orderNo + ", orderId=" + orderId + ", orderProduct=" + orderProduct
        + ", orderCount=" + orderCount + ", orderDate=" + orderDate + ", product=" + product
        + ", customer=" + customer + "]";
  }
}
