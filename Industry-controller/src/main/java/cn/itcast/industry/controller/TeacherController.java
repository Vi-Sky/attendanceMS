package cn.itcast.industry.controller;

import cn.itcast.industry.pojo.StudentIndustry;
import cn.itcast.industry.pojo.StudentList;
import cn.itcast.industry.service.TeacherService;


import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SuppressWarnings(value = "all")
public class TeacherController {
    /**
     * 跳转到登陆页面
     *
     * @return index
     */
    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = "login.action")
    public String forwardLogin() {
        return "login";
    }

    /**
     * 验证登陆，并且返回教师姓名
     *
     * @param username
     * @param password
     * @param request
     * @return
     */
    @RequestMapping(value = "validateLogin.action")
    public String validateLogin(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "password", required = false) String password, HttpServletRequest request) {
        String name = teacherService.validateLogin(username, password);
        if (name != null) {
            request.getSession().setAttribute("name", name);
            request.getSession().setAttribute("username", username);
            return "redirect:studentList.action?username="+username;
        }
        return "login";
    }

    /**
     * 跳转到detail页面
     *
     * @return
     */
    @RequestMapping(value = "detail.action")
    public String forwardDeatil() {
        return "redirect:studentList.action";
    }


    /**
     * 注销用户，并且返回到登陆页面
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "cancel.action")
    public String cancel(HttpSession session) {
        session.removeAttribute("name");
        return "login";
    }

    /**
     * 更新用户信息
     *
     * @param name
     * @param password
     * @param username
     * @return
     */
    @RequestMapping(value = "update.action")
    public String update(HttpSession session, @RequestParam(value = "name", required = false) String name, @RequestParam(value = "password", required = false) String password, @RequestParam(value = "username", required = false) String username) {
        teacherService.updateInfo(username, password, name);
//        修改用户session的name值时，先将原先的remove掉，然后在设置新的session
        session.removeAttribute("name");
        session.setAttribute("name", name);
        return "redirect:studentList.action";
    }

    /**
     * 显示学生列表
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "studentList.action")
    public String studentList(HttpServletRequest request) {
        String username = request.getParameter("username");
        if(username == null){
            username = (String) request.getSession().getAttribute("username");
        }
        System.out.println(username);
        //根据教师username来查询该教师所教课程
        List<String> courseList = teacherService.selectTeacherCourse(username);
        request.setAttribute("courseList",courseList);
        return "detail";
    }

    /**
     * 显示当前课程的学生列表
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "studentListforCourse.action")
    @ResponseBody
    public List<StudentList> studentListforCourse(HttpServletRequest request, @RequestBody String string) {
//        String string = request.getParameter("string");
        System.out.println(string);
        JSONObject jsonObject = new JSONObject(string);
        System.out.println(jsonObject.toString()+"aaaaaaaaaaaaaaaaaa");
        List<StudentList> studentList = teacherService.studentList(jsonObject.getString("courseName"));
        return studentList;
    }


    /**
     * 记录学生考勤信息
     *
     * @param request
     * @param state
     * @param stuid
     * @return
     */
    @RequestMapping(value = "industry.action")
    public String industryRecord(HttpServletRequest request, @RequestParam(value = "industry", required = false) String[] state, @RequestParam(value = "stuid", required = false) Integer stuid) {
        String[] params = (String[]) request.getParameterValues("industry");
        for (String p : params) {
            //分别得到学生的学号，然后在for循环里调用方法进行修改record表的数据
            String number_state[] = p.split("-");
            //umber_state[0]为学号umber_state[1]为状态
            teacherService.updateRecord(number_state[0], number_state[1]);
        }
        return "redirect:studentList.action";
    }

    /**
     * 利用AJAX查询所有学生考勤，由于a标签触发的时间对DIV进行显示，从而刷新了页面 ，所以只能进行页面局部刷新
     *
     * @return
     */
    @RequestMapping(value = "seeState.action")
    @ResponseBody
    public List<StudentIndustry> seeState() {
        return teacherService.selectStudentState();
    }

    /**
     * 系专业联动
     *
     * @return
     * @throws DocumentException
     */
    @RequestMapping(value = "major")
    @ResponseBody
    public List<String> major(HttpServletRequest request) throws DocumentException {
        //创建解析器
        SAXReader saxReader = new SAXReader();
        //得到系名称
        String dept = request.getParameter("dept");
        //读取文件
        InputStream inputStream = TeacherController.class.getClassLoader().getResourceAsStream("dept-maj.xml");
        Document read = saxReader.read(inputStream);
        //得到根标签P
        Element rootElement = read.getRootElement();
        //获取所有dept元素
        List<Element> depts = rootElement.elements("dept");
        //遍历depts 得到其中的 name属性值 与传过来的参数dept进行判断
        for (Element element : depts) {
            //如果和传过来的参数名称相同,则返回该标签下面的maj元素的text值 并保存在list集合中
            if (element.attributeValue("name").equals(dept)) {
                //得到所有maj元素
                List<Element> majs = element.elements("maj");
                List<String> majsName = new ArrayList<String>();
                for (Element maj : majs) {
                    majsName.add(maj.getText());
                }
                return majsName;
            }
        }
        return null;
    }

    /**
     * 根据条件查询学生考勤情况
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "conditionForList")
    public List<StudentIndustry> conditionForList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String major = request.getParameter("maj");
        String gender = request.getParameter("gender");
        String name = request.getParameter("name");
        map.put("major", major);
        map.put("gender", gender);
        map.put("name", name.trim());
        if (name==null||name!="")
            System.out.println("null");
        else
            System.out.println("no null");
        for (String s : map.keySet()) {
            System.out.println(s+":::::"+map.get(s));
        }
        List<StudentIndustry> list = teacherService.conditionForList((HashMap) map);
        return list;
    }

}

