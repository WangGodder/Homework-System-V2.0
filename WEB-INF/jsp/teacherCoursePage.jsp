<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <link rel="stylesheet" href="../css/bootstrap.css">
      <script type="text/javascript" src="../js/teacherCoursePage.js"></script>

      <!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
      <!-- <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script> -->

      <style>
        html,
        body {
          height: 100%;
          background-color: #F0F0F0;
        }

        #navbar,
        #footer {
          background-color: #0483D4;

          text-align: center;
          color: #8099af;
          font: normal 12px/20px microsoft YaHei;
          margin: 15px;
          padding: 10px;

        }

        #main {
          margin-top: 20px;

        }

        .courseName {
          font: normal 24px/45px "microsoft YaHei";
          color: #fff !important;
          padding: 5px;
        }

        .tt {
          color: #333333;
          font: bold 15px/42px "microsoft YaHei";
          margin-left: 20px;
          /* float: left; */
        }

        #left img {
          display: block;
          margin: 0 auto;
        }

        #left a {
          color: black;

        }

        #left a:hover {
          text-decoration: none;
        }
      </style>
      <title>作业提交系统V2.0----${course.getName() }</title>
    </head>

    <body>
      <input id="teachCourseId" type="hidden" value="${teachCourse.getId()}" />

      <header>
        <nav id="navbar" class="navbar navbar-dark d-flex justify-content-center" style="height: 60px;">
          <a class="navbar-brand logo_2" href="#">
            <img src="../images/logo.png" style="margin-top:-3px">
            <span class="courseName">${course.getName()} </span>
          </a>
        </nav>
      </header>




      <section class="h-75">
        <div id="main" class="container-fluid col-10 h-75">
          <div class="row h-100">

            <div id="left" class="col-md-3 col-sm-4 h-100">
              <div class="bg-white w-100 h-100">
                <span class="tt">索引</span>
                <hr style="margin-top: 0;">

                <div class="row">
                  <div class="col-6" style="padding-right: 0">
                    <a href="${teachCourse.getId()}" style="text-align: center;">
                      <img src="../images/ico_but_index.png" width="48px" height="48px" alt="">
                      <h5>首頁</h5>
                    </a>
                  </div>
                  <div class="col-6" style="padding-left: 0">
                    <a href="javascript:studentList()" style="text-align: center">
                      <img src="../images/ico_but_stu.png" width="48px" height="48px" alt="">
                      <h5>课程名单</h5>
                    </a>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-6" style="padding-right: 0">
                    <a href="javascript:homework()" style="text-align: center;">
                      <img src="../images/ico_but_write.png" width="48px" height="48px" alt="">
                      <h5>查看作业</h5>
                    </a>
                  </div>
                  <div class="col-6" style="padding-left: 0">
                    <a href="javascript:goResource()" style="text-align: center;">
                      <img src="../images/ico_but_res.png" width="48px" height="48px" alt="">
                      <h5>课程资源</h5>
                    </a>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-6" style="padding-right: 0">
                    <a href="javascript:goMessage()" style="text-align: center">
                      <img src="../images/ico_but_message.png" width="48px" height="48px" alt="">
                      <h5>发布消息</h5>
                    </a>
                  </div>
                  <div class="col-6" style="padding-left: 0">
                    <a hre2f="javascript:;" href=";" style="text-align: center" data-toggle="modal" data-target="#AreYouSure">
                      <img src="../images/ico_but_del.png" alt="">
                      <h5>删除课程</h5>
                    </a>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-6" style="padding-right: 0">
                    <a href="javascript:window.close();" style="text-align: center">
                      <img src="../images/ico_but_go.png" width="48px" height="48px" alt="">
                      <h5>关闭页面</h5>
                    </a>
                  </div>
                  <div class="col-6">
                    <!-- <a href="javascript:;">
                        <img src="img/ico_but_talk.png" alt="">
                        <h5>删除课程</h5>
                      </a> -->
                  </div>
                </div>

              </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="AreYouSure" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">确定删除该课程？</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                	    删除后将不可恢复，你确定删除？
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="">Save changes</button>
                  </div>
                </div>
              </div>
            </div>

            <div id="right" class="col-md-9 col-sm-8 h-100">
              <div class="bg-white h-100 w-100">

                <span class="tt">内容</span>
                <hr style="margin-top: 0;">
                <div id="subpage" class="templatemo-content" style="margin-left: 10px;margin-right: 10px;">
                  <div>
                    <h3>课程名称：${course.getName()}</h3>
                    <h3>开课时间： ${teachCourse.printSemestor()}</h3>
                    <div class="form-group">
                      <h3> 课程介绍</h3>
                      <textarea class="form-control" readonly="readonly">${course.getInfo()}</textarea>
                    </div>

                  </div>
                  <div>
                    <table class="layui-table">
                      <colgroup>
                        <col width="15%">
                        <col width="40%">
                        <col width="10%">
                      </colgroup>
                      <thead>
                        <tr>
                          <th>消息</th>
                          <th>内容</th>
                          <th>发布日期</th>

                        </tr>
                        <c:forEach var="message" items="${messages}" varStatus="status">
                          <tr>
                            <td>${message.getName() }</td>
                            <td>${message.getInfo() }</td>
                            <td>${message.getDate() }</td>

                          </tr>
                        </c:forEach>
                      </thead>
                      <tbody class="users_content"></tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </section>



      <footer>
        <div id="footer" class="container-fluid text-center">
          <p class="text-white" style="margin: 0;"> Copyright &copy; 2018 作业提交系统 </p>
        </div>
      </footer>


      <!-- <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> -->
      <script src="../js/jquery-3-3-1-min.js"></script>
      <script src="../js/bootstrap.min.js"></script>
      <script src="../js/Chart.min.js"></script>
      <script src="../js/templatemo_script.js"></script>
      <!-- <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/popper.min.js"></script> -->
    </body>

    </html>