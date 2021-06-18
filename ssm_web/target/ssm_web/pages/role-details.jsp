<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="common/base.jsp"%>
<html>
<head>
    <jsp:include page="common/link.jsp"></jsp:include>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">


    <!-- 页面头部 -->
    <jsp:include page="common/header.jsp"/>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="common/aside.jsp"/>

    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                用户管理
                <small>用户详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">用户管理</a></li>
                <li class="active">用户详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <div class="box-body">
                <!--树表格-->
                <div class="tab-pane" id="tab-treetable">
                    <table id="collapse-table" class="table table-bordered table-hover dataTable">
                        <thead>
                        <tr>
                            <th>角色及资源访问权限</th>
                            <th>描述</th>
                        </tr>
                        </thead>
                        <tr data-tt-id="0">
                            <td>${role.roleName}</td>
                            <td>${role.roleDesc}</td>
                        </tr>

                        <tbody>
                        <c:forEach items="${role.permissions}" var="permission" >
                            <tr data-tt-id="1" data-tt-parent-id="0">
                                <td>${permission.permissionName}</td>
                                <td>${permission.url}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--树表格/-->
            </div>
            <div class="text-right">
                <button type="button" style="background-color: #bababa" class="btn bg-default" onclick="history.back(-1);">返回</button>
            </div>
        </section>
        <!-- 正文区域 /-->

    </div>

    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="common/foot.jsp"/>
    <!-- 底部导航 /-->

</div>

<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {

        /*table tree*/
        $("#collapse-table").treetable({
            expandable: true
        });

    });

    $(document).ready(function() {

        CKEDITOR.replace('editor1');

        // $(".textarea").wysihtml5({
        //     locale:'zh-CN'
        // });

        $("#markdown-textarea").markdown({
            language: 'zh',
            autofocus: false,
            savable: false
        });

    });

    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-dataform");

    });
</script>
</body>
</html>