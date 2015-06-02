package cis.itcompany;

import dao.ProjectDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.Collection;

/**
 * Created by Yarik on 02.06.2015.
 */
public class Main {

    public static void main(String[] args) {

        /*ProjectDao projectDao = new ProjectDao();
        Collection<DBDriverProjectEntity> projects = projectDao.getAllProjects();
        System.out.println("size = " + projects.size());*/
        Transaction tx = null;

        //projectDao.create(new DBDriverProjectEntity());
    }
}
