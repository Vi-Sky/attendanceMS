package cn.itcast.industry.service;

import cn.itcast.industry.dao.TeacherDao;
import cn.itcast.industry.pojo.StudentIndustry;
import cn.itcast.industry.pojo.StudentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

    @Override
    public String validateLogin(String username, String password) {
        return teacherDao.validateLogin(username, password);
    }

    @Override
    public void updateInfo(String username, String password, String name) {
        teacherDao.updateInfo(username, password, name);
    }

    @Override
    public List<StudentList> studentList(String courseName) {
        return teacherDao.studentList(courseName);
    }

    @Override
    public void updateRecord(String number, String state) {
        if (state.equals("lazy")) {
            teacherDao.updateRecord(Integer.parseInt(number), "r_lateTime");
        } else if (state.equals("ill")) {
            teacherDao.updateRecord(Integer.parseInt(number), "r_illTime");
        } else {
            teacherDao.updateRecord(Integer.parseInt(number), "r_time");
        }

    }

    @Override
    public List<StudentIndustry> selectStudentState() {
        return teacherDao.selectStudentState();
    }

    @Override
    public List<StudentIndustry> conditionForList(HashMap map) {
        return teacherDao.conditionForList(map);
    }

    @Override
    public List<String> selectTeacherCourse(String username) {
        return teacherDao.selectTeacherCourse(username);
    }


}
