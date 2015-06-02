package cis.itcompany;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "project", schema = "public", catalog = "Database4")
public class DBDriverProjectEntity {
    private int projectid;
    private String name;
    private Date datestart;
    private Date deadline;
    private Integer price;

    public static final String nameInDB = "project";

    public DBDriverCompanyEntity companyEntity;
    public DBDriverCustomerEntity customerEntity;

    public DBDriverEmployeeEntity[] employees;


    @Id
    @Column(name = "projectid")
    public int getProjectid() {
        return projectid;
    }

    public void setProjectid(int projectid) {
        this.projectid = projectid;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "datestart")
    public Date getDatestart() {
        return datestart;
    }

    public void setDatestart(Date datestart) {
        this.datestart = datestart;
    }

    @Basic
    @Column(name = "deadline")
    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    @Basic
    @Column(name = "price")
    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverProjectEntity that = (DBDriverProjectEntity) o;

        if (projectid != that.projectid) return false;
        if (datestart != null ? !datestart.equals(that.datestart) : that.datestart != null) return false;
        if (deadline != null ? !deadline.equals(that.deadline) : that.deadline != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = projectid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (datestart != null ? datestart.hashCode() : 0);
        result = 31 * result + (deadline != null ? deadline.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        return result;
    }
}
