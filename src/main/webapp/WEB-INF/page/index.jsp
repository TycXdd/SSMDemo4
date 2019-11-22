<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--
HTML 的 lang 属性可用于网页或部分网页的语言。这对搜索引擎和浏览器是有帮助的。比如,谷歌浏览器根据代码<html lang="en">就会知道网页是英文的，就会问是否需要翻译成中文。
强烈建议为 html 根元素指定 lang 属性，从而为文档设置正确的语言。这将有助于语音合成工具确定其所应该采用的发音，有助于翻译工具确定其翻译时所应遵守的规则等等。
1:不区分大小写
-->
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
<div id="navbar" class="page-header" style="margin-top:20px; padding-left:10px;">
    <h4>基本增删改查模板</h4>
</div>

<div id="main-container" class="container-fluid">
    <div class="row">
        <div id="nav" class="col-md-2 col-sm-1">
            <div class="list-group">
                <c:forEach items="${currentUser.menus}" var="menu">
                    <a href="${pageContext.request.contextPath}/${menu.url}" target="contentIFrame" class="list-group-item">${menu.menuName}</a>
                </c:forEach>
            </div>
        </div>
        <div id="main-content" class="col-md-10 col-sm-11">
            <!--content iframe-->
            <div class="embed-responsive">
                <iframe class="embed-responsive-item" name="contentIFrame" id="contentIFrame" src="about:blank"
                        allowfullscreen></iframe>
            </div>
        </div>
    </div>

</div>

<div id="footer" class="footer"></div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<!-- Bootstrp3 需要 jQuery1.9-3  -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#contentIFrame").on("load", function () {
            /*如果嵌套页面的高度大于当前的高度，则修改div的高度*/
            var frameHeight = $(this).contents().find("body").height();
            /* 使用#contentIFrame无效 */
            if ($(".embed-responsive").height() < frameHeight) {
                $(".embed-responsive").height(frameHeight);
            }
        });
    });
</script>
</body>

</html>
