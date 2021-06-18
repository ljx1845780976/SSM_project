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
                产品管理
                <small>产品添加</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="product/findAllProduct">产品管理</a></li>
                <li class="active">产品添加</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">
            <form action="role/save">
                <div class="panel panel-default">
                    <div class="panel-heading">角色信息</div>
                    <div class="row data-type">
                        <div class="col-md-2 title">角色名</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="roleName" value="">
                        </div>

                        <div class="col-md-2 title">角色描述</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control"  name="roleDesc" value="">
                        </div>


                </div>


                <!-- .box-body -->


            </form>
            <div class="box-tools text-center">
                <button type="submit" class="btn bg-maroon">保存</button>
                <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
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

        // 激活导航位置
        setSidebarActive("travellog-manage");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        $('#dateTimePicker').datetimepicker({
            format: "yyyy-mm-dd HH:mm",
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN'
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