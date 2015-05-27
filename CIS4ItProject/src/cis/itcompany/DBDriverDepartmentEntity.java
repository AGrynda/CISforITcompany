package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "department", schema = "public", catalog = "Database4")
public class DBDriverDepartmentEntity {
    private int departmentid;
    private String name;

    public DBDriverCompanyEntity companyEntity;
    public DBDriverEmployeeEntity[] employees;

    @Id
    @Column(name = "departmentid")
    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverDepartmentEntity that = (DBDriverDepartmentEntity) o;

        if (departmentid != that.departmentid) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = departmentid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
