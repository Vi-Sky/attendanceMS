package cn.itcast.industry.pojo;

public class StudentIndustry {
    private String stuname;
    private String gender;
    private String grade;
    private String pro;
    private String course;
    private Integer illTime;
    private Integer lateTime;

    @Override
    public String toString() {
        return "StudentIndustry{" +
                "stuname='" + stuname + '\'' +
                ", gender='" + gender + '\'' +
                ", grade='" + grade + '\'' +
                ", pro='" + pro + '\'' +
                ", course='" + course + '\'' +
                ", illTime=" + illTime +
                ", lateTime=" + lateTime +
                ", missTime=" + missTime +
                '}';
    }

    private Integer missTime;

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    public Integer getIllTime() {
        return illTime;
    }

    public void setIllTime(Integer illTime) {
        this.illTime = illTime;
    }

    public Integer getLateTime() {
        return lateTime;
    }

    public void setLateTime(Integer lateTime) {
        this.lateTime = lateTime;
    }

    public Integer getMissTime() {
        return missTime;
    }

    public void setMissTime(Integer missTime) {
        this.missTime = missTime;
    }
}
