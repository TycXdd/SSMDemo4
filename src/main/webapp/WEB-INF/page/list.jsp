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
    <div class="panel panel-default">
        <div class="panel-body">
            <!-- 标题 -->
            <div class="row">
                <div class="col-md-12">
                    <h4 style="margin-bottom:0px;padding-bottom:10px;border-bottom: 1px solid #e3e3e3;">信息列表</h4>
                </div>
            </div>

            <div class="row" style="margin-top:20px;">
                <div class="col-md-12">
                    <form class="form-inline" action="${pageContext.request.contextPath}/user/page">
                        <div class="form-group">
                            <label class="sr-only" for="userName">用户名</label>
                            <input type="text" class="form-control" id="userName" name="userName" value="${userName}"
                                   placeholder="用户名">
                        </div>
                        <button type="submit" id="search" class="btn btn-default">搜索</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4 style="margin-bottom:0px;padding-bottom:10px;border-bottom: 1px solid #e3e3e3;"></h4>
                </div>
            </div>
            <div class="row" style="Rmargin-top:15px;">
                <div class="col-md-12">
                    <div class="btn-group" role="group" aria-label="...">

                        <button type="button" class="btn btn-default" id="addRecord">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新建
                        </button>

                        <button type="button" class="btn btn-default" id="updRecord">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改
                        </button>

                        <button type="button" class="btn btn-default" id="delRecord">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                        </button>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <div class="col-md-12 table-responsive">
                    <table id="result-table" class="table  table-bordered table-hover table-condensed">
                        <thead>

                        <tr>
                            <th class="center">
                                <input type="checkbox"/> <span class="lbl"></span>
                            </th>
                            <th>用户ID</th>
                            <th>用户名</th>
                            <th>密码</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.result}" var="user">
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" name="id" value="${user.userId}"/>
                                    </label>
                                </td>
                                <td>
                                        ${user.userId}
                                </td>
                                <td>
                                        ${user.userName}
                                </td>
                                <td>
                                        ${user.password}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">当前第 ${page.startIndex + 1} - ${page.startIndex+page.result.size()} 条
                    共计 ${page.total} 条
                </div>

                <div class="col-md-10">
                    <ul class="pagination pagination-sm pull-right" style="margin: 0px;">
                        <li class="${page.pageNum == 1 ?'disabled':''}">
                            <a href="#"
                               <c:if test="${page.pageNum != 1}">
                                   onclick="pageLoad(1)"
                               </c:if>
                            >首页</a>
                        </li>
                        <li class="${page.pageNum == 1? 'disabled':''}">
                            <a href="#"
                                <c:if test="${page.pageNum - 1 >= 1}">
                                    onclick="pageLoad(${page.pageNum - 1})"
                                </c:if>
                            >上一页</a>
                        </li>
                        <li>
                            <a href="#">1</a>
                        </li>
                        <li>
                            <a href="#">2</a>
                        </li>
                        <li>
                            <a href="#">3</a>
                        </li>
                        <li>
                            <a href="#">4</a>
                        </li>

                        <li class="next ${page.pageNum == page.pages?'disabled':''}">
                            <a href="#"
                                    <c:if test="${page.pageNum != page.pages}">
                                        onclick="pageLoad(${page.pageNum + 1})"
                                    </c:if>
                            >下一页</a>
                        </li>
                        <li class="${page.pageNum==page.pages?'disabled':''}">
                            <a href="#"
                                    <c:if test="${page.pageNum!=page.pages}">
                                        onclick="pageLoad(${page.pages})"
                                    </c:if>
                            >尾页</a>
                        </li>
                    </ul>
                </div>
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
    /* 基础路径，如：http://locahost:8080 */
    var baseUrl = "${pageContext.request.contextPath}/user/";
    $(document).ready(function () {
        //全选复选框
        $('#result-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
            var th_checked = this.checked;
            $(this).closest('table').find('tbody > tr').each(function () {
                var row = this;
                if (th_checked) {
                    $(row).find('input[type=checkbox]').eq(0).prop('checked', true);
                } else {
                    $(row).find('input[type=checkbox]').eq(0).prop('checked', false);
                }
            });
        });
    });


    //注册更新按钮的事件
    $(document).ready(function () {

        //注册新建按钮的事件
        $('#addRecord').on('click', function () {
            load(baseUrl + 'form');
        });

        $('#updRecord').on('click', function () {
            var keyCheckBoxs = $('#result-table> tbody > tr > td input[type=checkbox]:checked');
            if (keyCheckBoxs.length == 1) {
                var params = $('#result-table> tbody > tr > td input[type=checkbox]:checked').serialize();
                load(baseUrl + 'find', params);
            } else if (keyCheckBoxs.length == 0) {

                alert('请选中更新的记录');
            } else {

                alert('选中太多的记录');
            }
        });
        $('#delRecord').on('click', function () {
            var keyCheckBoxs = $('#result-table > tbody > tr > td input[type=checkbox]:checked');
            if (keyCheckBoxs.length != 0) {
                var paramsDelete = $('#result-table > tbody > tr > td input[type=checkbox]:checked').serialize();
                var paramsSearch = $('#search-div input,select').serialize();
                load(baseUrl + 'delete', paramsDelete + '&' + paramsSearch);
            } else {

                alert('请选中删除的记录');
            }
        });
    });

    /*分页查询*/
    function pageLoad(pageNum) {
        var params = $("input,select").serialize();
        params += "&pageSize=${page.pageSize}&pageNum=" + pageNum;
        load(baseUrl + "page", params);
    }

    function loadShowPage(id) {
        var params = "ids=" + id;
        load(baseUrl + "get/show", params);
    }

    /*加载对应页面*/
    function load(url, params) {
        if (params != undefined) {
            url = url + "?" + params
        }
        $(window.parent.document).find("#contentIFrame").attr("src", url);
    }
</script>
</body>

</html>
