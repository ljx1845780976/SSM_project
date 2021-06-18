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
                订单管理
                <small>订单详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="product/findAllProduct">订单管理</a></li>
                <li class="active">订单详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="panel panel-default">
                <div class="box-header with-border">
                    <h3 class="box-title">订单信息</h3>
                </div>


                <!-- 数据表格 -->
                <div class="table-box">


                    <!--数据列表-->
                    <!--tab内容-->
                    <div class="tab-pane" id="tab-common">
                        <div class="row data-type">
                                <div class="col-md-2 title">订单编号</div>
                                <div class="col-md-4 data">
                                    <input readonly="readonly" class="form-control"  value="${order.orderNum}">
                                </div>
                                <div class="col-md-2 title">下单时间</div>
                                <div class="col-md-4 data">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input readonly="readonly" class="form-control pull-right" value="${order.orderTimeStr}" >
                                    </div>
                                </div>
                                <div class="col-md-2 title">路线名称</div>
                                <div class="col-md-4 data">
                                    <input readonly="readonly" class="form-control" value="${order.product.productName}">
                                </div>

                                <div class="col-md-2 title">出发城市</div>
                                <div class="col-md-4 data">
                                    <input readonly="readonly" class="form-control"  value="${order.product.cityName}">
                                    </div>

                                <div class="col-md-2 title">出发时间</div>
                                <div class="col-md-4 data">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input readonly="readonly" class="form-control pull-right" value="${order.product.departureTimeStr}" >
                                    </div>
                                </div>

                                <div class="col-md-2 title">出游人数</div>
                                <div class="col-md-4 data">
                                    <input readonly="readonly" class="form-control" value="${order.peopleCount}" >
                                </div>

                                <div class="col-md-2 title rowHeight2x">其他信息</div>
                                <div class="col-md-10 data rowHeight2x">
                                    ${order.orderDesc}
                                </div>


                        </div>

                    </div>
                </div>
            </div>

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">游客信息</h3>
                </div>
                <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                    <tr role="row">
                        <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" >人群</th>
                        <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" >姓名</th>
                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" >性别</th>
                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" >手机号码</th>
                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" >证件类型</th>
                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" >证件号码</th></tr>
                    <c:forEach items="${order.travellers}" var="traveller">
                        <tr><th rowspan="1" colspan="1">${traveller.travellerTypeStr}</th>
                            <th rowspan="1" colspan="1">${traveller.name}</th>
                            <th rowspan="1" colspan="1">${traveller.sex}</th>
                            <th rowspan="1" colspan="1">${traveller.phoneNum}</th>
                            <th rowspan="1" colspan="1">${traveller.credentialsTypeStr}</th>
                            <th rowspan="1" colspan="1">${traveller.credentialsNum}</th></tr>
                    </c:forEach>
                </table>
            </div>
            <div class="panel panel-default">
                <div class="box-header with-border">
                    <h3 class="box-title">联系人信息</h3>
                </div>
                <div class="row data-type">
                <div class="col-md-2 title">会员</div>
                <div class="col-md-4 data text" >${order.member.nickname} </div>
                <div class="col-md-2 title" >联系人</div>
                <div class="col-md-4 data text" >${order.member.name} </div>
                <div class="col-md-2 title" >手机号</div>
                <div class="col-md-4 data text" >${order.member.phoneNum} </div>
                <div class="col-md-2 title" >邮箱</div>
                <div class="col-md-4 data text" >${order.member.email} </div>
                </div>
            </div>
            <c:if test="${order.orderStatus==1}">
            <div class="panel panel-default">
                <div class="box-header with-border">
                    <h3 class="box-title">费用信息</h3>
                </div>
                <div class="row data-type">
                <div class="col-md-2 title" >支付方式</div>
                <div class="col-md-4 data text" >在线支付-${order.payTypeStr} </div>
                <div class="col-md-2 title" >金额</div>
                <div class="col-md-4 data text" >￥${order.product.productPrice} </div>
                </div>
            </div>
            </c:if>
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