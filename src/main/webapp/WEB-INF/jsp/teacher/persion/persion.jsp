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
        <br> <a href="/teacher/zhuye">
            <p>
                <i><strong>个性化学习平台</strong></i>
            </p>
        </a>
    </div>
    <div class="container-fluid bg-info text-white">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-info text-white">
                <a class="navbar-brand">&nbsp;</a>
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                    data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="true"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse show" id="collapsibleNavId">
                    <div class="container ">
                        <ul class="navbar-nav mr-auto row mt-2 mt-lg-0">
                            <li class="nav-item active"><a class="nav-link" href="/teacher/zhuye">主页</a></li>
                            <li><a class="nav-link" href="/teacher/course">课程管理</a></li>
                            <li><a class="nav-link" href="/teacher/course/notice-course">作业通知</a></li>
                            <li><a class="nav-link" href="">讨论圈子</a></li>
                            <li><a class="nav-link" href="">切换账号</a></li>
                            <li><a class="nav-link " href="">退出登录</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
  <!--个人信息页面部分-->
  <!-- 模态框 -->
  <div id="upload" class="container">
    <!-- 模态框 -->
    <div class="modal fade" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- 模态框头部 -->
          <div class="modal-header">
            <h6>上传照片</h6>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <!-- 模态框主体 -->
          <div class="modal-body">
            <div style="width: 300px;height: 300px;">
              <img :src="imagePath" style="width: 300px;height: 300px;" alt="">
            </div>
            <div class="form-group">
              <input type="file" @change="preview" class="form-control-file" id="image1" pattern="" placeholder=""
                aria-describedby="fileHelpId">
              <small id="fileHelpId" class="form-text text-muted">.png | jpg文件,文件小于1M,250*250</small>
            </div>
            <button @click="uploads" name="" id="" class="btn btn-primary">上传</button>
          </div>
          <!-- 模态框底部 -->
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    var data = { imagePath: "img/upload.png", imageSize: '', imageName: '', files: '' }
    var app = new Vue({
      el: "#upload",
      data: data,
      methods: {
        preview() {
          this.files = document.getElementById("image1").files[0];
          var files = this.files;
          this.imageName = files.name;
          this.imageSize = (files.size / 1024).toFixed(0);
          this.imagePath = this.getObjectURL(files);
          if (this.imageSize > 1024) {
            this.imageName = '';
            this.imageSize = '';
            this.imagePath = "img/upload.png";
            document.getElementById("image1").value = '';
            alert("文件大于1M");
          } else if (!this.imageName.match(/\.(png|jpg)$/)) {
            this.imageName = '';
            this.imageSize = '';
            this.imagePath = "img/upload.png";
            document.getElementById("image1").value = '';
            alert("文件类型不匹配");
          };
        },
        getObjectURL(file) {
          let url = null;
          if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
          } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
          } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
          }
          return url;
        },
        uploads: function () {
          if (this.imageSize > 1024) {
            this.imageName = '';
            this.imageSize = '';
            this.imagePath = "img/upload.png";
            document.getElementById("image1").value = '';
            alert("文件大于1M");
            return false;
          } else if (!this.imageName.match(/\.(png|jpg)$/)) {
            this.imageName = '';
            this.imageSize = '';
            this.imagePath = "img/upload.png";
            document.getElementById("image1").value = '';
            alert("文件类型不匹配");
            return false;
          };
          var formData = new FormData;
          formData.append("image", this.files);
          axios.post("/teacher/persion/upload", formData)
            .then(res => {
              alert("上传成功");
              location.reload();
            })
            .catch(err => {
              alert("上传失败,请重新登录");
            })
        }
      },
    });
  </script>



  <div id="abc" class="container mr-auto mt-lg-2 mt-sm-2 col-lg-8 col-sm-8 bg-light">
    <form>
      <div class="row">
        <div class="media p-3 ">
          <img :src="data.teacher_photo" onerror="javascript:this.src='/images/teacher/1.png'" alt="John Doe"
            class="mr-3 mt-3 rounded-circle" style="width: 60px; height: 60px;">
          <div data-toggle="modal" data-target="#myModal" style="cursor: pointer;" class="btn mt-5">修改头像</div>
        </div>
      </div>

      <div class="form-group">
        <label for="exampleInputname">账号</label>
        <input v-model="data.id" type="text" class="form-control" id="name" disabled>
      </div>
      <div class="form-group">
        <label for="exampleInputname">姓名</label>
        <input v-model="data.teacher_name" type="text" class="form-control" id="name" disabled>
      </div>
      <div class="form-group">
        <label for="exampleInputname">性别</label>

        <select class="form-control" v-model="data.teacher_sex" disabled id="sel1">
          <option value="男">男</option>
          <option value="女">女</option>
        </select>
      </div>

      <div class="form-group">
        <label for="exampleInputphone">联系电话</label>
        <input v-model="data.teacher_phone" type="number" class="form-control" id="phone" disabled>
      </div>

      <div class="form-group">
        <div class="form-group">
          <label for="exampleInputname">学院</label>
          <input v-model="data.teacher_coll" type="text" class="form-control" id="name" disabled>
        </div>
      </div>

      <div class="form-group">
        <div class="form-group">
          <label for="exampleInputname">职称</label>
          <input v-model="data.teacher_rank" type="text" class="form-control" id="name" disabled>
        </div>
      </div>
      <br>
      <a href="/teacher/persion/persoin-edit" class="btn btn-primary">编辑资料</a>
      <a href="/teacher/persion/edit-pwd" class="btn mx-4 btn-primary" >修改密码</a>
    </form>
  </div>
  <br>
  <!--脚本-->
  <script>
    var data = {data:${data}};
    // var data = { data: {"courses":null,"id":"1","teacher_birth":null,"teacher_coll":"理学院","teacher_name":"赵六","teacher_per":null,"teacher_phone":"1234","teacher_photo":"1234","teacher_rank":"讲师","teacher_sex":"男"}};
    var app = new Vue({
      el: '#abc',
      data: {
        data:data.data
      },
    });
  </script>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="/bootstrap-4.3.1/jquery-3.3.1.slim.min.js "></script>
  <script src="/bootstrap-4.3.1/popper.min.js "></script>
  <script src="/bootstrap-4.3.1/js/bootstrap.min.js "></script>
</body>

</html>