<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 模板</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">

</head>

<body>
<div id="main-container" class="container-fluid">
    <div class="page-content">
        <div class="panel panel-default">
            <div class="panel-body">
                <!-- 标题 -->
                <div class="row">
                    <div class="col-md-12">
                        <c:if test="${empty user.userId}">
                            <h4 style="margin-bottom:0px;padding-bottom:10px;border-bottom: 1px solid #e3e3e3;">
                                数据创建</h4>
                        </c:if>
                        <c:if test="${not empty user.userId}">
                            <h4 style="margin-bottom:0px;padding-bottom:10px;border-bottom: 1px solid #e3e3e3;">
                                数据修改</h4>
                        </c:if>
                    </div>
                </div>
                <form class="form-horizontal" role="form" style="padding-top:10px ;" action="${pageContext.request.contextPath}/user/addAndUpdate" method="post">
                    <div class="row ">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="userName"> 姓名:</label>
                                <div class="col-sm-9">
                                    <input type="hidden" value="${user.userId}" name="userId">
                                    <input type="text" class="form-control" id="userName" placeholder="姓名"
                                           name="userName" value="${user.userName}"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="password"> 密码:</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="password" placeholder="密码"
                                           name="password" value="${user.password}"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row ">
                        <div class="col-md-12">
                            <div class="col-sm-2" style="margin-left: calc((65% - 10px) / 2)">
                                <button type="submit" class="btn btn-default "
                                        style="border-radius: 4px;padding-left:20px;padding-right:20px;float: right">确定
                                </button>
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn  btn-default " id="cancel" style="border-radius: 4px">
                                    取消
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<!-- Bootstrp3 需要 jQuery1.9-3  -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    $(document).ready(function () {
        //返回查询页面
        $('#cancel').click(function () {
            window.history.back(-1);
        });
    });
</script>
</body>
</html>

