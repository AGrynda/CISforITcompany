package cis.itcompany;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "r_7", schema = "public", catalog = "Database4")
public class EmployeeProject {

    @Id
    public int primaryKey;
    @Column(name = "employeeid")
    public int employeeId;


    public int projectId;
}
