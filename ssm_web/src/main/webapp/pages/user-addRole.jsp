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
                <small>角色添加</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="product/findAllProduct">用户管理</a></li>
                <li class="active">角色添加</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <!-- 正文区域 -->
        <section class="content">
            <form action="user/addRoles" method="post">

            <!-- .box-body -->
            <div class="box box-primary">

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <input type="hidden" name="userId" value="${user.id}">
                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right:0px;">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting_asc">ID</th>
                                <th class="sorting">角色名</th>
                                <th class="sorting">描述</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${roles}" var="role">
                                <tr>
                                    <td><input name="ids" type="checkbox" value="${role.id}"></td>
                                    <td>
                                            ${role.id}
                                    </td>
                                    <td>${role.roleName}</td>
                                    <td>${role.roleDesc}</td>


                                </tr>
                            </c:forEach>



                            </tbody>
                        </table>
                        <!--数据列表/-->

                        <!--工具栏-->

                        <!--工具栏/-->

                    </div>
                    <!-- 数据表格 /-->


                </div>

            </div>

            <div class="box-tools text-center">
                <button type="submit" class="btn bg-maroon">添加</button>
                <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
            </div>
            </form>
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

        // 激活导航位置
        setSidebarActive("travellog-manage");
        // $("#delete").click(function () {
        //      var checked=$("#ids").is(':checked');
        //      var id=$("#ids").attr("value");
        //      if(checked){
        //           location.href="role/deleteById?id="+id;
        //      }
        // });
        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>
</html>