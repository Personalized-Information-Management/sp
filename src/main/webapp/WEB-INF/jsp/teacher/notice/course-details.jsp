<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">

<head>
    <title>课程详细页面</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="/js/vue.js"></script>
    <script src="/js/axios.min.js"></script>
</head>

<body>
    <div class="card text-center container">
        <div class="card-header">
            <ul class="nav nav-pills card-header-pills">
                <li class="nav-item">
                    <a class="nav-link active" href="/teacher/course/notice-course">返回</a>
                </li>
                <li class="nav-item">
                    <div class="nav-link disabled">课程介绍</div>
                </li>
            </ul>
        </div>
    </div>
    <div id="app" class="container">
        <div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <table>
                            <tr>
                                <td>
                                    <img :src="data.course_photo" style="width: 200px;" alt="">
                                </td>
                                <td class="px-4 pt-5">
                                    <table>
                                        <tr>
                                            <td>
                                                <div>课程名：</div>
                                            </td>
                                            <td>
                                                <div>{{data.course_name}}</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                创建时间：
                                            </td>
                                            <td>
                                                <div style="font-size: 10divx;">{{data.course_time|timeTransform}}
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                        </table>
                        <br>
                        <br>
                        </td>
                        </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="jumbotron">
                <div class="row">
                    <div class="lead">课程简介</div>
                </div>
                <hr class="my-2">
                <p>{{data.course_introduce}}</p>
            </div>
            <div>课程内容</div>

            <div v-for="(item, index) in data1">
                <h3>
                    <div><a :name="index"></a> 第{{index+1}}章|{{item.title}}</div>
                </h3>
                <div v-html="item.content"></div>
            </div>
        </div>
    </div>

    <!--脚本-->
    <script>
        var data = {
            data: ${data}
        };
        data.data1 = JSON.parse(data.data.course_content);
        var app = new Vue({
            el: '#app',
            data: data,
            methods: {
                addstudy: function () {
                    if (this.data.id != '') {
                        document.getElementById("addstudy").disabled = true;
                        var formDate = new FormData();
                        formDate.append("course_id", this.data.id)
                        axios.post("/course/study-req", formDate)
                            .then(res => {
                                console.log(res.data);
                                if (res.data == -1) {
                                    alert("添加失败");
                                } else if (res.data == 0) {
                                    alert("已添加");
                                } else if (res.data == 1) {
                                    alert("添加成功")
                                }
                                document.getElementById("addstudy").disabled = false;
                            })
                            .catch(err => {
                                alert("添加失败")
                                document.getElementById("addstudy").disabled = false;
                            })
                    }
                },
                shoucang: function () {
                    if (this.data.id != '') {
                        document.getElementById("shoucang").disabled = true;
                        var formDate = new FormData();
                        formDate.append("course_id", this.data.id)
                        axios.post("/course/collect-req", formDate)
                            .then(res => {
                                console.log(res.data);
                                if (res.data == -1) {
                                    alert("收藏失败");
                                } else if (res.data == 0) {
                                    alert("已收藏");
                                } else if (res.data == 1) {
                                    alert("收藏成功")
                                }
                                document.getElementById("shoucang").disabled = false;
                            })
                            .catch(err => {
                                alert("收藏失败")
                                document.getElementById("shoucang").disabled = false;
                            })
                    }
                }
            },
            filters: {
                timeTransform: function (value) {
                    var str = value + "000000000000000000000000000000000000000000000000000000000000000";
                    a = new Date(Number(str.substr(0, 13)));
                    return a.getFullYear() + '年' + a.getMonth() + "月" + a.getDate();
                }
            },
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>