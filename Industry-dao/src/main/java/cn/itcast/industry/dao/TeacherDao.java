package cn.itcast.industry.dao;

import cn.itcast.industry.pojo.StudentIndustry;
import cn.itcast.industry.pojo.StudentList;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface TeacherDao {

    public String validateLogin(String username, String password);

    public void updateInfo(String username, String password, String name);

    public List<StudentList> studentList(String courseName);

    public void updateRecord(@Param("number") Integer number, @Param("state") String state);

    public List<StudentIndustry> selectStudentState();

    public List<StudentIndustry> conditionForList(HashMap map);

    public List<String> selectTeacherCourse(String username);
}
