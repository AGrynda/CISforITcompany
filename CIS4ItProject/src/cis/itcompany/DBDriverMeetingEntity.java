package cis.itcompany;

import javax.persistence.*;

/**
 * Created by Yarik on 27.05.2015.
 */
@Entity
@Table(name = "meeting", schema = "public", catalog = "Database4")
public class DBDriverMeetingEntity {
    private int meetingid;
    private String topic;
    private Integer organizatorid;

    public DBDriverEmployeeEntity organizatorEntity;
    public DBDriverEmployeeEntity[] employees;

    @Id
    @Column(name = "meetingid")
    public int getMeetingid() {
        return meetingid;
    }

    public void setMeetingid(int meetingid) {
        this.meetingid = meetingid;
    }

    @Basic
    @Column(name = "topic")
    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    @Basic
    @Column(name = "organizatorid")
    public Integer getOrganizatorid() {
        return organizatorid;
    }

    public void setOrganizatorid(Integer organizatorid) {
        this.organizatorid = organizatorid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DBDriverMeetingEntity that = (DBDriverMeetingEntity) o;

        if (meetingid != that.meetingid) return false;
        if (organizatorid != null ? !organizatorid.equals(that.organizatorid) : that.organizatorid != null)
            return false;
        if (topic != null ? !topic.equals(that.topic) : that.topic != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = meetingid;
        result = 31 * result + (topic != null ? topic.hashCode() : 0);
        result = 31 * result + (organizatorid != null ? organizatorid.hashCode() : 0);
        return result;
    }
}
