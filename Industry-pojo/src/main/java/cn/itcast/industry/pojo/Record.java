package cn.itcast.industry.pojo;


public class Record {

    private long rId;
    private long rTime;//缺勤次数
    //病假次数
    private Integer rIllTime;
    //迟到次数
    private Integer rLateTime;
    private long rStuId;
    private long rTeaId;
    private long rCourId;

    public Integer getrIllTime() {
        return rIllTime;
    }

    public void setrIllTime(Integer rIllTime) {
        this.rIllTime = rIllTime;
    }

    public Integer getrLateTime() {
        return rLateTime;
    }

    public void setrLateTime(Integer rLateTime) {
        this.rLateTime = rLateTime;
    }

    public long getRId() {
        return rId;
    }

    public void setRId(long rId) {
        this.rId = rId;
    }


    public long getRTime() {
        return rTime;
    }

    public void setRTime(long rTime) {
        this.rTime = rTime;
    }


    public long getRStuId() {
        return rStuId;
    }

    public void setRStuId(long rStuId) {
        this.rStuId = rStuId;
    }


    public long getRTeaId() {
        return rTeaId;
    }

    public void setRTeaId(long rTeaId) {
        this.rTeaId = rTeaId;
    }


    public long getRCourId() {
        return rCourId;
    }

    public void setRCourId(long rCourId) {
        this.rCourId = rCourId;
    }

}
