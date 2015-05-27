package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "equipmenttype", schema = "public", catalog = "Database4")
public class DBDriverEquipmenttypeEntity {
    private int equipmenttypeid;
    private String equipmenttypename;

    @Id
    @Column(name = "equipmenttypeid")
    public int getEquipmenttypeid() {
        return equipmenttypeid;
    }

    public void setEquipmenttypeid(int equipmenttypeid) {
        this.equipmenttypeid = equipmenttypeid;
    }

    @Basic
    @Column(name = "equipmenttypename")
    public String getEquipmenttypename() {
        return equipmenttypename;
    }

    public void setEquipmenttypename(String equipmenttypename) {
        this.equipmenttypename = equipmenttypename;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverEquipmenttypeEntity that = (DBDriverEquipmenttypeEntity) o;

        if (equipmenttypeid != that.equipmenttypeid) return false;
        if (equipmenttypename != null ? !equipmenttypename.equals(that.equipmenttypename) : that.equipmenttypename != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = equipmenttypeid;
        result = 31 * result + (equipmenttypename != null ? equipmenttypename.hashCode() : 0);
        return result;
    }
}
