package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "cashflowtype", schema = "public", catalog = "Database4")
public class DBDriverCashflowtypeEntity {
    private int cashflowtypeid;
    private String cashflowtypename;



    @Id
    @Column(name = "cashflowtypeid")
    public int getCashflowtypeid() {
        return cashflowtypeid;
    }

    public void setCashflowtypeid(int cashflowtypeid) {
        this.cashflowtypeid = cashflowtypeid;
    }

    @Basic
    @Column(name = "cashflowtypename")
    public String getCashflowtypename() {
        return cashflowtypename;
    }

    public void setCashflowtypename(String cashflowtypename) {
        this.cashflowtypename = cashflowtypename;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverCashflowtypeEntity that = (DBDriverCashflowtypeEntity) o;

        if (cashflowtypeid != that.cashflowtypeid) return false;
        if (cashflowtypename != null ? !cashflowtypename.equals(that.cashflowtypename) : that.cashflowtypename != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cashflowtypeid;
        result = 31 * result + (cashflowtypename != null ? cashflowtypename.hashCode() : 0);
        return result;
    }
}
