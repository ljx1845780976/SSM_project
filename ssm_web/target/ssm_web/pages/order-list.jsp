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
                <small>订单列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="order/findAllOrder">订单管理</a></li>
                <li class="active">订单列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
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
                                <th class="sorting">订单编号</th>
                                <th class="sorting">产品名称</th>

                                <th class="">金额</th>
                                <th class="">下单时间</th>
                                <th class="">订单状态</th>

                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody><%--pageInfo.list 获取每页里的内容--%>
                            <c:forEach items="${pageInfo.list}" var="order">
                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>
                                            ${order.id}
                                    </td>
                                    <td>${order.orderNum}</td>
                                    <td>${order.product.productName}</td>

                                    <td class="text-center">${order.product.productPrice}</td>
                                    <td>${order.orderTimeStr}</td>
                                    <td class="text-center">${order.orderStatusStr}</td>

                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>订单</button>
                                        <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-review-list.html"'>编辑</button>
                                        <button type="button" class="btn bg-olive btn-xs" onclick='location.href="order/findById?id=${order.id}"'>详情</button>
                                    </td>
                                </tr>
                            </c:forEach>



                            </tbody>
                        </table>
                        <!--数据列表/-->

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建" onclick='location.href="#"'><i class="fa fa-file-o"></i> 新建</button>
                                    <button type="button" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")'><i class="fa fa-trash-o"></i> 删除</button>
                                    <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <input type="text" class="form-control input-sm" placeholder="搜索">
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
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
                            总共${pageInfo.pages}页，共${count}条数据。 每页
                            <select class="form-control" id="changePageSize" onchange="changePageSize()">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose >
                                    <c:when test="${pageInfo.pageSize==i}">
                                        <option disabled selected="selected">${i}</option>
                                    </c:when >
                                    <c:otherwise>
                                        <option>${i}</option>
                                    </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="order/findAllOrder?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="order/findAllOrder?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                            <c:choose>
                                <%--一、页面总数小于5时--%>
                                <c:when test="${pageInfo.pages<=5}">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="${pageInfo.pages}" />
                                </c:when>
                                <%--二、页面总数大于5时--%>
                                <c:when test="${pageInfo.pages>5}">
                                    <c:choose>
                                        <%--二.1、当前页面不大于3时--%>
                                        <c:when test="${pageInfo.pageNum<=3}">
                                            <c:set var="begin" value="1"/>
                                            <c:set var="end" value="5" />
                                        </c:when>
                                        <%--二.2、当前页面大于3小于总数-4时--%>
                                        <c:when test="${pageInfo.pageNum>3 && pageInfo.pageNum<pageInfo.pages-4}">
                                            <c:set var="begin" value="${pageInfo.pageNum-2}"/>
                                            <c:set var="end" value="${pageInfo.pageNum+2}" />
                                        </c:when>
                                        <%--二.3、当前页面不小于总数-4时--%>
                                        <c:otherwise>
                                            <c:set var="begin" value="${pageInfo.pages-4}"/>
                                            <c:set var="end" value="${pageInfo.pages}" />
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                            </c:choose>
                            <c:forEach begin="${begin}" end="${end}" var="i">
                                <c:if test="${i==pageInfo.pageNum}" >
                                    <li ><a  disabled style="background: #eee" >${i}</a></li>
                                </c:if>
                                <c:if test="${i!=pageInfo.pageNum}">
                                    <li> <a href="order/findAllOrder?page=${i}&size=${pageInfo.pageSize}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <li><a href="order/findAllOrder?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li> <%--pages属性为末页--%>
                                <a href="order/findAllOrder?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                            </li>
                        </ul>
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



<script type="text/javascript">
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
    function changePageSize(){
        //获取下拉框的值
        var pageSize=$("#changePageSize").val();
        //向服务器发送请求，改变每页显示条数
        location.href="order/findAllOrder?page=1&size="+ pageSize;
    }

    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("travellog-manage");

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