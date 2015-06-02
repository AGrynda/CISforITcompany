package dao;

import cis.itcompany.DBDriverProjectEntity;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;


/**
 * Created by Yarik on 02.06.2015.
 */
public class ProjectDao extends AbstractDao<DBDriverProjectEntity> {

    public ProjectDao() {
        createEntityManagerFactory(DBDriverProjectEntity.nameInDB);
    }

    @Override
    public void update(DBDriverProjectEntity e) {
        e.setDatestart(new Date(Calendar.getInstance().getTime().getTime()));
        super.update(e);
    }

    public Collection<DBDriverProjectEntity> getAllProjects() {
        Collection<DBDriverProjectEntity> projects = null;
        EntityManager entityManager = getEntityManager();
        try {
            entityManager.getTransaction().begin();
            StringBuffer queryString = new StringBuffer("select p from").append(DBDriverProjectEntity.nameInDB).append("p");
            Query query = entityManager.createQuery(queryString.toString());
            projects = (Collection<DBDriverProjectEntity>) query.getResultList();
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }

        return projects;
    }

    @Override
    public void create(DBDriverProjectEntity e) {
        e.setDatestart(new Date(Calendar.getInstance().getTime().getTime()));
        super.create(e);
    }

    @Override
    public Class<?> getEntityClass() {
        return DBDriverProjectEntity.class;
    }
}
