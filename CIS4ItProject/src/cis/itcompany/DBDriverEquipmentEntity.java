package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "equipment", schema = "public", catalog = "Database4")
public class DBDriverEquipmentEntity {
    private int equipmentid;
    private Integer quantity;

    public DBDriverEquipmenttypeEntity equipmenttypeEntity;

    @Id
    @Column(name = "equipmentid")
    public int getEquipmentid() {
        return equipmentid;
    }

    public void setEquipmentid(int equipmentid) {
        this.equipmentid = equipmentid;
    }

    @Basic
    @Column(name = "quantity")
    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverEquipmentEntity that = (DBDriverEquipmentEntity) o;

        if (equipmentid != that.equipmentid) return false;
        if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = equipmentid;
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        return result;
    }
}
