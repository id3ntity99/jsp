package kr.co.jboard.dao;

import java.util.List;

public interface Accessible<T> {
  public void insert(T dto);

  public T select(T dto);

  public List<T> selectAll(T dto);

  public void update(T dto);

  public void delete(T dto);
}
