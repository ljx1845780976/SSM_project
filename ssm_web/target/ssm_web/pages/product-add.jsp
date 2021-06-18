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

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">产品信息</h3>
                </div>


                    <!-- 数据表格 -->
                    <div class="table-box">


                        <!--数据列表-->
                        <!--tab内容-->
                        <div class="tab-pane" id="tab-common">
                            <div class="row data-type">
                             <form action="product/save">
                                <div class="col-md-2 title">产品编号</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" placeholder="产品编号" name="productNum" value="">
                                </div>

                                <div class="col-md-2 title">产品名称</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" placeholder="产品名称" name="productName" value="">
                                </div>

                                <div class="col-md-2 title">产品价格</div>
                                <div class="col-md-4 data">
                                    <div class="input-group">
                                        <span class="input-group-addon">¥</span>
                                        <input type="text" class="form-control" name="productPrice">
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                </div>

                                <div class="col-md-2 title">产品状态</div>
                                <div class="col-md-4 data">
                                    <select name="productStatus" class="form-control">
                                        <option value="1">打开</option>
                                        <option value="0" selected="selected">关闭</option>
                                    </select>
                                </div>

                                <div class="col-md-2 title">出发城市</div>
                                    <div class="col-md-4 data">
                                    <input type="text" class="form-control" name="cityName" placeholder="出发城市">

                                </div>
                                    <div class="col-md-2 title">出发时间</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" name="departureTime" id="dateTimePicker">
                                        </div>
                                    </div>
                                <div class="col-md-2 title rowHeight2x">产品描述</div>
                                <div class="col-md-10 data rowHeight2x">
                                    <textarea name="productDesc" class="form-control" rows="3" placeholder="请输入..."></textarea>
                                </div>
                                <div class="col-md-2 title"></div>
                                <div class="col-md-10 data text-center">
                                    <button type="submit" class="btn bg-maroon">保存</button>
                                    <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
                                </div>
                             </form>
                            </div>
                        </div>
                    </div>
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