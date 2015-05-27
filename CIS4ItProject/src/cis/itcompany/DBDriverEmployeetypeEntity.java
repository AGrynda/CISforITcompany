package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "employeetype", schema = "public", catalog = "Database4")
public class DBDriverEmployeetypeEntity {
    private int employeetypeid;
    private String typename;

    @Id
    @Column(name = "employeetypeid")
    public int getEmployeetypeid() {
        return employeetypeid;
    }

    public void setEmployeetypeid(int employeetypeid) {
        this.employeetypeid = employeetypeid;
    }

    @Basic
    @Column(name = "typename")
    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverEmployeetypeEntity that = (DBDriverEmployeetypeEntity) o;

        if (employeetypeid != that.employeetypeid) return false;
        if (typename != null ? !typename.equals(that.typename) : that.typename != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = employeetypeid;
        result = 31 * result + (typename != null ? typename.hashCode() : 0);
        return result;
    }
}
