package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "mailing", schema = "public", catalog = "Database4")
public class DBDriverMailingEntity {
    private int mailingid;
    private String text;

    public DBDriverAttachmentEntity[] attachments;

    @Id
    @Column(name = "mailingid")
    public int getMailingid() {
        return mailingid;
    }

    public void setMailingid(int mailingid) {
        this.mailingid = mailingid;
    }

    @Basic
    @Column(name = "text")
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverMailingEntity that = (DBDriverMailingEntity) o;

        if (mailingid != that.mailingid) return false;
        if (text != null ? !text.equals(that.text) : that.text != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = mailingid;
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }
}
