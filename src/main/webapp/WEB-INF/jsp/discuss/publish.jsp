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

    <style type="text/css">
        .toolbar {
            border: 1px solid rgb(0, 0, 0);
        }

        .text {
            border: 1px solid rgb(2, 2, 2);
            height: 400px;
        }
    </style>
</head>

<body>
    <div id="app" class="container">
        <div class="form-group">
            <small id="helpId" class="form-text text-muted">标题</small>
            <input type="text" class="form-control" v-model="title" name="" id="" aria-describedby="helpId"
                placeholder="">
        </div>
        <small id="helpId" class="form-text text-muted">正文</small>
        <div id="editor">
        </div>
        <button @click="publish" class="btn bg-primary "> 发布</button>
        <button class="btn bg-primary " onclick="editor.txt.clear();">清空</button>


        <!-- <button id="btn1">获取html</button>
        <button id="btn2">获取text</button>
        <button id="btn3">获取json</button>
        <xmp id="dis">{{content}}</xmp>
        <xmp id="dis1"></xmp> -->
    </div>
    <script>


        var data = { title: '', html: '', content: '' };
        var app = new Vue({
            el: '#app',
            data: data,
            methods: {
                publish: function () {
                    if (this.title == '') {
                        alert("标题不能为空");
                        return 0;
                    }
                    this.content = editor.txt.text();
                    if (this.content == '') {
                        alert("内容不能为空");
                        return 0;
                    }
                    var formdata = new FormData();
                    formdata.append("title", this.title);
                    this.html = editor.txt.html();
                    formdata.append("html", this.html);
                    axios.post("/dis/publish", formdata)
                        .then(res => {
                            alert("发布成功！");
                            location.href="/dis";
                        })
                        .catch(err => {
                            alert("发布失败!");
                        })
                }
            },

        })
    </script>
    <script src="/wangEditor/wangEditor.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;

        var editor = new E(document.getElementById('editor'))
        //创建之前自定义视图
        editor.customConfig.menus = [
            // 'head',  // 标题
            'bold',  // 粗体
            // 'fontSize',  // 字号
            // 'fontName',  // 字体
            'italic',  // 斜体
            'underline',  // 下划线
            'strikeThrough',  // 删除线
            'foreColor',  // 文字颜色
            'backColor',  // 背景颜色
            'link',  // 插入链接
            'list',  // 列表
            'justify',  // 对齐方式
            'quote',  // 引用
            'emoticon',  // 表情
            // 'image',  // 插入图片
            'table',  // 表格
            // 'video',  // 插入视频
            'code',  // 插入代码
            'undo',  // 撤销
            'redo'  // 重复
        ];
        editor.customConfig.emotions = [
            {
                // tab 的标题
                title: 'emoji',
                // type -> 'emoji' / 'image'
                type: 'emoji',
                // content -> 数组
                content: ['😀', '😃', '😄', '😁', '😆', '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆', '😉', '😊', '😋', '😎', '😍', '😘', '😗', '😙', '😚', '🙂', '🤗', '🤩', '🤔', '🤨', '😐', '😑', '😶', '🙄', '😏', '😀', '😃', '😄', '😁', '😆', '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆', '😉', '😊', '😋', '😎', '😍', '😘', '😗', '😙', '😚', '🙂', '🤗', '🤩', '🤔', '🤨', '😐', '😑', '😶', '🙄', '😏', '😀', '😃', '😄', '😁', '😆', '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆', '😉', '😊', '😋', '😎', '😍', '😘', '😗', '😙', '😚', '🙂', '🤗', '🤩', '🤔', '🤨', '😐', '😑', '😶', '🙄', '😏', '😀', '😃', '😄', '😁', '😆', '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆', '😉', '😊', '😋', '😎', '😍', '😘', '😗', '😙', '😚', '🙂', '🤗', '🤩', '🤔', '🤨', '😐', '😑', '😶', '🙄', '😏', '😀', '😃', '😄', '😁', '😆', '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆', '😉', '😊', '😋', '😎', '😍', '😘', '😗', '😙', '😚', '🙂', '🤗', '🤩', '🤔', '🤨', '😐', '😑', '😶', '🙄', '😏']
            }
        ];
        editor.create();
        // document.getElementById('btn1').addEventListener('click', function () {
        //     // 读取 html
        //     document.getElementById('dis').innerHTML = editor.txt.html();
        // }, false)

        // document.getElementById('btn2').addEventListener('click', function () {
        //     // 读取 text
        //     document.getElementById('dis').innerHTML = editor.txt.text();
        // }, false)
        // document.getElementById('btn3').addEventListener('click', function () {
        //     var json = editor.txt.getJSON()  // 获取 JSON 格式的内容
        //     var jsonStr = JSON.stringify(json)
        //     document.getElementById('dis').innerHTML = json;
        //     document.getElementById('dis1').innerHTML = jsonStr;
        // });
        //不能粘贴图片
        editor.customConfig.pasteIgnoreImg = false;
    </script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/bootstrap-4.3.1/jquery-3.3.1.slim.min.js "></script>
    <script src="/bootstrap-4.3.1/popper.min.js "></script>
    <script src="/bootstrap-4.3.1/js/bootstrap.min.js "></script>
</body>

</html>