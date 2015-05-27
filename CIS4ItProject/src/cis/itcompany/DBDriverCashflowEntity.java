package cis.itcompany;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "cashflow", schema = "public", catalog = "Database4")
public class DBDriverCashflowEntity {
    private int cashflowid;
    private String comment;
    private Date operationdate;
    private Integer amount;

    public DBDriverCompanyEntity companyEntity;
    public DBDriverCashflowtypeEntity cashflowtypeEntity;

    @Id
    @Column(name = "cashflowid")
    public int getCashflowid() {
        return cashflowid;
    }

    public void setCashflowid(int cashflowid) {
        this.cashflowid = cashflowid;
    }

    @Basic
    @Column(name = "comment")
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Basic
    @Column(name = "operationdate")
    public Date getOperationdate() {
        return operationdate;
    }

    public void setOperationdate(Date operationdate) {
        this.operationdate = operationdate;
    }

    @Basic
    @Column(name = "amount")
    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverCashflowEntity that = (DBDriverCashflowEntity) o;

        if (cashflowid != that.cashflowid) return false;
        if (amount != null ? !amount.equals(that.amount) : that.amount != null) return false;
        if (comment != null ? !comment.equals(that.comment) : that.comment != null) return false;
        if (operationdate != null ? !operationdate.equals(that.operationdate) : that.operationdate != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cashflowid;
        result = 31 * result + (comment != null ? comment.hashCode() : 0);
        result = 31 * result + (operationdate != null ? operationdate.hashCode() : 0);
        result = 31 * result + (amount != null ? amount.hashCode() : 0);
        return result;
    }
}
