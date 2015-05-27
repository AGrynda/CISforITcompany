package cis.itcompany;

import javax.persistence.*;

@Entity
@Table(name = "company", schema = "public", catalog = "Database4")
public class DBDriverCompanyEntity {
    private int companyid;
    private String name;
    private String logo;
    private Integer currentbudget;

    public DBDriverProjectEntity[] projects;
    public DBDriverDepartmentEntity[] departments;


    @Id
    @Column(name = "companyid")
    public int getCompanyid() {
        return companyid;
    }

    public void setCompanyid(int companyid) {
        this.companyid = companyid;
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
    @Column(name = "logo")
    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    @Basic
    @Column(name = "currentbudget")
    public Integer getCurrentbudget() {
        return currentbudget;
    }

    public void setCurrentbudget(Integer currentbudget) {
        this.currentbudget = currentbudget;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverCompanyEntity that = (DBDriverCompanyEntity) o;

        if (companyid != that.companyid) return false;
        if (currentbudget != null ? !currentbudget.equals(that.currentbudget) : that.currentbudget != null)
            return false;
        if (logo != null ? !logo.equals(that.logo) : that.logo != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = companyid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (logo != null ? logo.hashCode() : 0);
        result = 31 * result + (currentbudget != null ? currentbudget.hashCode() : 0);
        return result;
    }
}
