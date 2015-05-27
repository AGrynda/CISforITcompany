package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "attachment", schema = "public", catalog = "Database4")
public class DBDriverAttachmentEntity {
    private int attachmentid;
    private String content;

    public DBDriverMailingEntity mailingEntity;

    @Id
    @Column(name = "attachmentid")
    public int getAttachmentid() {
        return attachmentid;
    }

    public void setAttachmentid(int attachmentid) {
        this.attachmentid = attachmentid;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverAttachmentEntity that = (DBDriverAttachmentEntity) o;

        if (attachmentid != that.attachmentid) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = attachmentid;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        return result;
    }
}
