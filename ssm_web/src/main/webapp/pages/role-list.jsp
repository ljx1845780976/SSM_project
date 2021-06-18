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
                角色管理
                <small>角色列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="product/findAllProduct">角色管理</a></li>
                <li class="active">角色列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">
             <form action="role/deleteById">
            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title"> <div class="box-tools pull-right">
                        <div class="has-feedback">
                            <input type="text" class="form-control input-sm" placeholder="搜索">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </div></h3>


                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">


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

                                <th class="text-center">操作</th>
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


                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" onclick='location.href="role/findRoleIdAndOtherPermissions?id=${role.id}"'>添加权限</button>
                                        <button type="button" class="btn bg-olive btn-xs" onclick='location.href="role/findById?id=${role.id}"'>详情</button>

                                    </td>
                                </tr>
                            </c:forEach>



                            </tbody>
                        </table>
                        <!--数据列表/-->

                        <!--工具栏-->
                        <div class="pull-right">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建" onclick='location.href="pages/role-add.jsp"'><i class="fa fa-file-o"></i> 新建</button>
                                    <button id="delete" type="submit" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")'><i class="fa fa-trash-o"></i> 删除</button>
                                    <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                </div>
                            </div>
                        </div>

                        <!--工具栏/-->

                    </div>
                    <!-- 数据表格 /-->


                </div>
                <%--页码--%>
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共2 页，共14 条数据。 每页
                            <select class="form-control">
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>50</option>
                                <option>80</option>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="#">上一页</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">下一页</a></li>
                            <li>
                                <a href="#" aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>

                </div>


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