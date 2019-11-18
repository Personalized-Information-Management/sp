<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">

<head>
  <title>个人信息</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <!--注意引入css文件用link-->
  <script scr="/bootstrap-4.3.1/js/bootstrap.min.js"></script>
  <link href="/bootstrap-4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <!--vue.js-->
  <script src="/js/vue.js"></script>
  <!--axios.js-->
  <script src="/js/axios.min.js"></script>
</head>

<body>

  <!-- 导航栏 -->
  <div>
    <div class="container">
      <br>
      <a href="http://localhost:8080/zhuye">
        <p><i><strong>个性化学习平台</strong></i></p>
      </a>
    </div>
    <div class="container-fluid bg-info text-white">
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-info text-white">
          <a class="navbar-brand">&nbsp;</a>
          <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId" aria-expanded="true" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="navbar-collapse collapse show" id="collapsibleNavId">
            <div class="container ">
              <ul class="navbar-nav mr-auto row mt-2 mt-lg-0">
                <li class="nav-item active"><a class="nav-link" href="/zhuye">主页</a></li>
                <li><a class="nav-link" href="/course">课程</a></li>
                <li><a class="nav-link" href="#">作业</a></li>
                <li><a class="nav-link" href="/notice">课程通知</a></li>
                <li><a class="nav-link" href="/dis">讨论区</a></li>
                <li><a class="nav-link" href="/logins">切换账号</a></li>
                <li><a class="nav-link " href="/logout">退出登录</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </div>
  <!--个人信息页面部分-->

  <div id="abc" class="container mr-auto mt-lg-2 mt-sm-2 col-lg-8 col-sm-8 bg-light">
    <form action="/persion/edit" method="post">
      <div class="form-group">
        <label for="exampleInputname">账号</label>
        <input disabled="disabled" v-model="id" type="text" class="form-control">
        <input v-model="id" name="id" type="text" style="display: none;">
      </div>
      <div class="form-group">
        <label for="exampleInputname">姓名</label>
        <input v-model="student_name" name="student_name" id="student_name" type="text" class="form-control">
      </div>
      <div class="form-group">
        <label for="exampleInputname">性别</label>

        <select class="form-control" v-model="student_sex" id="student_sex" name="student_sex">
          <option value="男">男</option>
          <option value="女">女</option>
        </select>
      </div>

      <div class="form-group">
        <label for="exampleInputphone">联系电话</label>
        <input v-model="student_phone" type="number" id="student_phone" class="form-control" name="student_phone"
          pattern="[0-9]*" title="仅数字">
      </div>

      <div class="form-group">
        <div class="form-group">
          <label for="exampleInputname">学院</label>
          <input v-model="student_col" type="text" id="student_col" class="form-control" name="student_col">
        </div>
      </div>

      <div class="form-group">
        <div class="form-group">
          <label for="exampleInputname">专业</label>
          <input v-model="student_majo" type="text" id="student_majo" class="form-control" name="student_majo">
        </div>
      </div>
      <br>
      <button type="submit" class="btn btn-primary" >保存修改</button><div class="mx-4 btn btn-primary" onclick="reset()">清空</div>
    </form>
  </div>
  <br>
  <!--脚本-->
  <script>
    var data = ${ json };
    var data1 = data;
    var app = new Vue({
      el: '#abc',
      data: data,
      methods: {
        fun1: function () {
          this.data = data1;
        }
      },
    });
  </script>
  <!-- 底部导航 -->
  <div id="nav_but">
    <runoob id="a1"></runoob>
  </div>
  <script src="/component/nav-button.js"></script>
  <script>
    new Vue({
      el: '#nav_but',
      components: {
        "runoob": runoob
      }
    });
    function reset() {
      document.getElementById("student_name").value = '';
      document.getElementById("student_sex").value = '';
      document.getElementById("student_phone").value = '';
      document.getElementById("student_col").value = '';
      document.getElementById("student_majo").value = '';
    }
  </script>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="/bootstrap-4.3.1/jquery-3.3.1.slim.min.js "></script>
  <script src="/bootstrap-4.3.1/popper.min.js "></script>
  <script src="/bootstrap-4.3.1/js/bootstrap.min.js "></script>
</body>

</html>