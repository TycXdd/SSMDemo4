<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <!--
        Bootstrap 不支持 IE 古老的兼容模式。为了让 IE 浏览器运行最新的渲染模式下，建议将此 <meta> 标签加入到页面中：
    -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--
        --initial-scale=1：初始大小比例
        --maximum-scale=1: 可以放大的比例。
        --user-scalable=no: 禁止用户手动放大或缩小网页。
    -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 模板</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">

</head>
<body>


<div class="modal-dialog  modal-sm" style="margin-top: 10%;">
    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <div class="modal-content">
            <div class="modal-header">

                <h4 class="modal-title text-center" id="myModalLabel">登录</h4>
            </div>
            <div class="modal-body" id="model-body">
                <div class="form-group">

                    <input type="text" class="form-control" placeholder="用户名" name="userName" autocomplete="off">
                </div>
                <div class="form-group">

                    <input type="password" class="form-control" placeholder="密码" name="password" autocomplete="off">
                    ${msg}
                </div>
            </div>
            <div class="modal-footer">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary form-control">登录</button>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-default form-control">注册</button>
                </div>

            </div>
        </div><!-- /.modal-content -->
    </form>
</div><!-- /.modal -->

</body>
</html>