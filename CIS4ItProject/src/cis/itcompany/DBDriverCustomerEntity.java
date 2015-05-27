package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "customer", schema = "public", catalog = "Database4")
public class DBDriverCustomerEntity {
    private int customerid;
    private String name;

    @Id
    @Column(name = "customerid")
    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
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

        DBDriverCustomerEntity that = (DBDriverCustomerEntity) o;

        if (customerid != that.customerid) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = customerid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
