<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Dashboard Template for Bootstrap</title>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/dashboard.css" rel="stylesheet" type="text/css">
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">考勤管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">${sessionScope.name}</a></li>
                <li>
                    <a href="#" data-toggle="modal" data-target="#myModal">
                        修改用户信息
                    </a>
                </li>
                <li><a href="${pageContext.request.contextPath}/cancel.action">注销</a></li>
                <li><a href="#">帮助</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="查找">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="${pageContext.request.contextPath}/studentList.action">记录学生考勤 <span
                        class="sr-only">(current)</span></a></li>
                <li><a href="#" id="selectStudentInfo">查看出勤状态</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="studentInfo">
            <div class="row placeholders"></div>
            <h2 class="sub-header">学生考勤</h2>
            <%--<div class="row">--%>
            <%--<div class="col-xs-2">--%>
            <%--<label class="control-label" for="formGroupInputLarge"--%>
            <%--style="margin-top: 6px;margin-left: 5px">姓名:</label>--%>
            <%--<input type="text" class="form-control" placeholder="姓名">--%>
            <%--</div>--%>
            <div class="col-xs-2">
                <label class="control-label" for="formGroupInputLarge"
                       style="margin-top: 6px;margin-left: 5px">课程选择:</label>
                <select class="form-control" id="courseName">
                    <c:forEach var="courseName" items="${courseList}">
                        <option value="${courseName}">${courseName}</option>
                    </c:forEach>
                </select>
            </div>
            <%--<div class="col-xs-3">--%>
            <%--<label class="col-sm-2 control-label" for="formGroupInputLarge"--%>
            <%--style="margin-top: 6px;margin-left: 5px">系:</label>--%>
            <%--<select class="form-control">--%>
            <%--<option>请选择</option>--%>
            <%--<option>计算机系</option>--%>
            <%--<option>机械系</option>--%>
            <%--<option>管理系</option>--%>
            <%--</select>--%>
            <%--</div>--%>
            <%--<div class="col-xs-4">--%>
            <%--<label class="col-sm-2 control-label" for="formGroupInputLarge"--%>
            <%--style="margin-top: 6px;margin-left: 5px">专业:</label>--%>
            <%--<select class="form-control">--%>
            <%--<option>请选择</option>--%>
            <%--<option>软件工程</option>--%>
            <%--<option>计算机科学与技术</option>--%>
            <%--<option>等等等</option>--%>
            <%--</select>--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="table-responsive">
                <form action="${pageContext.request.contextPath}/industry.action" method="post">
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>班级</th>
                            <th>专业</th>
                            <th>出勤情况</th>
                        </tr>
                        </thead>
                        <tbody id="addState">
                        <c:forEach items="${studentList}" var="student">
                            <tr>
                                <td>${student.stu_name}<input type="hidden" name="stuid" value="${student.stu_id}"/>
                                </td>
                                <td>${student.stu_gender}</td>
                                <td>${student.grade_name}</td>
                                <td>${student.maj_name}</td>
                                <td>迟到&nbsp;<input type="checkbox" name="industry" value="${student.stu_id}-lazy">&nbsp;&nbsp;
                                    缺勤&nbsp;<input type="checkbox" name="industry" value="${student.stu_id}-miss">&nbsp;&nbsp;
                                    病假&nbsp;<input type="checkbox" name="industry" value="${student.stu_id}-ill">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
            </div>
            <div style="text-align: center">

                <button type="submit" class="btn btn-success" value="提交" style="width: 500px">提交</button>

            </div>
            </form>
            <nav aria-label="Page navigation" style="text-align: right">
                <ul class="pagination  pagination-right">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">上一页</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">下一页</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="studentIndustry" style="display: none">
            <div class="row placeholders"></div>
            <h2 class="sub-header">学生考勤</h2>
            <div class="row">
                <div class="col-xs-2">
                    <label class="control-label" for="formGroupInputLarge"
                           style="margin-top: 6px;margin-left: 5px">姓名:</label>
                    <input type="text" class="form-control" placeholder="姓名" id="name" value="">
                </div>
                <div class="col-xs-2">
                    <label class="control-label" for="formGroupInputLarge"
                           style="margin-top: 6px;margin-left: 5px">性别:</label>
                    <select class="form-control" id="gender">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="col-xs-3">
                    <label class="col-sm-2 control-label" for="formGroupInputLarge"
                           style="margin-top: 6px;margin-left: 5px">系:</label>
                    <select class="form-control" id="dept">
                        <option>===请选择===</option>
                        <option value="计算机系">计算机系</option>
                        <option value="机械工程系">机械工程系</option>
                        <option value="信息工程系">信息工程系</option>
                        <option value="建筑系">建筑系</option>
                        <option value="管理系">管理系</option>
                        <option value="社会科学与外国语系">社会科学与外国语系</option>
                        <option value="建筑工程系">建筑工程系</option>
                        <option value="化工系">化工系</option>
                        <option value="艺术系">艺术系</option>
                    </select>
                </div>
                <div class="col-xs-4">
                    <label class="col-sm-2 control-label" for="formGroupInputLarge"
                           style="margin-top: 6px;margin-left: 5px">专业:</label>
                    <select class="form-control" id="maj">
                        <option>请先选择系别</option>
                    </select>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>班级</th>
                        <th>专业</th>
                        <th>课程</th>
                        <th>病假次数</th>
                        <th>迟到次数</th>
                        <th>缺勤次数</th>
                    </tr>
                    </thead>
                    <tbody id="studentIndustryTD">
                    </tbody>
                </table>
            </div>

            <nav aria-label="Page navigation" style="text-align: right">
                <ul class="pagination  pagination-right">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">上一页</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">下一页</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改用户信息
                </h4>
            </div>
            <form action="${pageContext.request.contextPath}/update.action" method="post">
                <div class="modal-body">
                    <label class="col-sm-2 control-label" for="formGroupInputLarge"
                           style="margin-top: 6px;margin-left: 5px">姓名:</label>
                    <input class="form-control" name="name" type="text" placeholder="姓名" id="formGroupInputLarge"
                           style="width: 300px;"><br>
                    <label class="col-sm-2 control-label" for="formGroupInputSmall"
                           style="margin-top: 6px;margin-left: 5px">密码:</label>
                    <input class="form-control" name="password" type="password" placeholder="密码"
                           id="formGroupInputSmall"
                           style="width: 300px; ">
                    <input type="hidden" value="${requestScope.username}" name="username">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
<!--换了一下两个js的加载顺序 就可以了（bootstrap依赖jquery，于是我抱着试一试的心态调整了引用顺序：）-->
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>

<script>
    $(document).ready(function () {
        $("#selectStudentInfo").click(function () {
            $("#studentInfo").hide();
            $("#studentIndustry").show();
            $.get("${pageContext.request.contextPath}/seeState.action", function (data) {
                for (var i = 0; i <= data.length; i++) {
                    $("#studentIndustryTD").append("<tr><td>" + data[i].stuname + "</td>"
                        + "<td>" + data[i].gender + "</td>"
                        + "<td>" + data[i].grade + "</td>"
                        + "<td>" + data[i].pro + "</td>"
                        + "<td>" + data[i].course + "</td>"
                        + "<td>" + data[i].illTime + "</td>"
                        + "<td>" + data[i].lateTime + "</td>"
                        + "<td>" + data[i].missTime + "</td></tr>");
                }
            })
        });

        $("#dept").change(function () {
            $.post("${pageContext.request.contextPath}/major.action", {dept: $("#dept").val()}, function (data) {
                $("#maj").html("");
                for (var i = 0; i < data.length; i++) {
                    $("#maj").append("<option>" + data[i] + "</option>");
                }

            })
        });

        $("#maj").change(function () {
            $.post("${pageContext.request.contextPath}/conditionForList.action", {
                maj: $("#maj").val(),
                gender: $("#gender").val(),
                name: $("#name").val()
            }, function (data) {
                $("#studentIndustryTD").html("");
                for (var i = 0; i < data.length; i++) {
                    $("#studentIndustryTD").append("<tr><td>" + data[i].stuname + "</td>"
                        + "<td>" + data[i].gender + "</td>"
                        + "<td>" + data[i].grade + "</td>"
                        + "<td>" + data[i].pro + "</td>"
                        + "<td>" + data[i].course + "</td>"
                        + "<td>" + data[i].illTime + "</td>"
                        + "<td>" + data[i].lateTime + "</td>"
                        + "<td>" + data[i].missTime + "</td></tr>");
                }
            })
        });


        $("#gender").change(function () {
            $.post("${pageContext.request.contextPath}/conditionForList.action", {
                gender: $("#gender").val(),
                maj: $("#maj").val(),
                name: $("#name").val()
            }, function (data) {
                $("#studentIndustryTD").html("");
                for (var i = 0; i < data.length; i++) {
                    $("#studentIndustryTD").append("<tr><td>" + data[i].stuname + "</td>"
                        + "<td>" + data[i].gender + "</td>"
                        + "<td>" + data[i].grade + "</td>"
                        + "<td>" + data[i].pro + "</td>"
                        + "<td>" + data[i].course + "</td>"
                        + "<td>" + data[i].illTime + "</td>"
                        + "<td>" + data[i].lateTime + "</td>"
                        + "<td>" + data[i].missTime + "</td></tr>");
                }
            })

        });

        $("#name").change(function () {
            $.post("${pageContext.request.contextPath}/conditionForList.action", {
                gender: $("#gender").val(),
                maj: $("#maj").val(),
                name: $("#name").val()
            }, function (data) {
                $("#studentIndustryTD").html("");
                for (var i = 0; i < data.length; i++) {
                    $("#studentIndustryTD").append("<tr><td>" + data[i].stuname + "</td>"
                        + "<td>" + data[i].gender + "</td>"
                        + "<td>" + data[i].grade + "</td>"
                        + "<td>" + data[i].pro + "</td>"
                        + "<td>" + data[i].course + "</td>"
                        + "<td>" + data[i].illTime + "</td>"
                        + "<td>" + data[i].lateTime + "</td>"
                        + "<td>" + data[i].missTime + "</td></tr>");
                }
            })

        });

        $("#courseName").change(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/studentListforCourse.action",
                data: JSON.stringify({courseName: $("#courseName").val(),house:"bigHouse"}),
                contentType:'application/json;charset=UTF-8',
                success: function (data) {
                    $("#addState").html("");
                    for (var i = 0; i < data.length; i++) {
                        $("#addState").append("<tr><td>" + data[i].stu_name + "</td>"
                            + "<td>" + data[i].stu_gender + "</td>"
                            + "<td>" + data[i].grade_name + "</td>"
                            + "<td>" + data[i].maj_name + "</td>"
                            + "<td>迟到&nbsp;" +
                            "<input type='checkbox' name='industry' value='data[i].stu_id'+'-lazy'>&nbsp;&nbsp;缺勤&nbsp;" +
                            "<input type='checkbox' name='industry' value='data[i].stu_id'+'-lazy'>&nbsp;&nbsp;病假&nbsp;" +
                            "<input type='checkbox' name='industry' value='data[i].stu_id'+'-lazy'>" +
                            "</td></tr>");
                    }
                }

            });
        });
    });


</script>

</html>
