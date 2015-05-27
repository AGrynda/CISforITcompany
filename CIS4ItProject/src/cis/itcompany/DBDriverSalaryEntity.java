package cis.itcompany;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "salary", schema = "public", catalog = "Database4")
public class DBDriverSalaryEntity {
    private int salaryid;
    private Integer amount;
    private Date startdate;
    private Date enddate;

    public DBDriverEmployeeEntity employeeEntity;

    @Id
    @Column(name = "salaryid")
    public int getSalaryid() {
        return salaryid;
    }

    public void setSalaryid(int salaryid) {
        this.salaryid = salaryid;
    }

    @Basic
    @Column(name = "amount")
    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "startdate")
    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    @Basic
    @Column(name = "enddate")
    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverSalaryEntity that = (DBDriverSalaryEntity) o;

        if (salaryid != that.salaryid) return false;
        if (amount != null ? !amount.equals(that.amount) : that.amount != null) return false;
        if (enddate != null ? !enddate.equals(that.enddate) : that.enddate != null) return false;
        if (startdate != null ? !startdate.equals(that.startdate) : that.startdate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = salaryid;
        result = 31 * result + (amount != null ? amount.hashCode() : 0);
        result = 31 * result + (startdate != null ? startdate.hashCode() : 0);
        result = 31 * result + (enddate != null ? enddate.hashCode() : 0);
        return result;
    }
}
