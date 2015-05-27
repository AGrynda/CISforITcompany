package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "office", schema = "public", catalog = "Database4")
public class DBDriverOfficeEntity {
    private int officeid;
    private String adress;

    public DBDriverCompanyEntity companyEntity;

    @Id
    @Column(name = "officeid")
    public int getOfficeid() {
        return officeid;
    }

    public void setOfficeid(int officeid) {
        this.officeid = officeid;
    }

    @Basic
    @Column(name = "adress")
    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverOfficeEntity that = (DBDriverOfficeEntity) o;

        if (officeid != that.officeid) return false;
        if (adress != null ? !adress.equals(that.adress) : that.adress != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = officeid;
        result = 31 * result + (adress != null ? adress.hashCode() : 0);
        return result;
    }
}
