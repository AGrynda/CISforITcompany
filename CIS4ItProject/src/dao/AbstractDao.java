package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

/**
 * Created by Yarik on 02.06.2015.
 */
public abstract class AbstractDao<T> implements GenericDao<T> {

    private String persistentName;

    private EntityManagerFactory factory;

    public void createEntityManagerFactory(String name) {
        this.persistentName = name;
        factory = Persistence.createEntityManagerFactory(persistentName);
    }

    public EntityManager getEntityManager() {
        return factory.createEntityManager();
    }

    public void create(T e) {
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        manager.persist(e);
        manager.getTransaction().commit();
        manager.close();
    }

    @SuppressWarnings("unchecked")
    public T read(Object id) {
        T readObject = null;
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        readObject = (T) manager.find(getEntityClass(), id);
        manager.getTransaction().commit();
        manager.close();
        return readObject;
    }

    public void update(T e) {
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        manager.refresh(e);
        manager.getTransaction().commit();
        manager.close();
    }

    public void delete(T e) {
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        manager.remove(e);
        manager.getTransaction().commit();
        manager.close();
    }

    public abstract Class<?> getEntityClass();
}
