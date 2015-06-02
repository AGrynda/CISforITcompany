package dao;

import java.io.Serializable;

/**
 * Created by Yarik on 02.06.2015.
 */
public interface GenericDao<T> extends Serializable {

    public void create(T e);
    public T read(Object id);
    public void update(T e);
    public void delete(T e);
}
