<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<aside id="left-panel">
    <nav>
        <ul>
            <li class="active open">
                <a href="<c:url value="/dashboard/showDashboard.action"/>" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">首頁</span></a>
                <ul style="display: block;">
                    <li class="active">
                        <a href="<c:url value="/hoststatus/hostStatusQry.action"/>" title="主機狀態查詢"><span>主機狀態查詢</span></a>
                    </li>
                    <li class="active">
                        <a href="<c:url value="/hostperf/hostPerformanceQry.action"/>" title="主機效能統計查詢"><span>主機效能統計查詢</span></a>
                    </li>
                </ul>

            </li>

            <%--<li>
                <a href="#"><i class="fa fa-lg fa-fw fa-list-alt"></i> <span class="menu-item-parent">帳單分析</span></a>
                <ul style="display: block;">
                    <li class="active">
                        <a href="index.html" title="Dashboard"><span class="menu-item-parent">使用明細</span></a>
                    </li>
                </ul>
            </li>--%>
            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-desktop"></i> <span class="menu-item-parent">監控</span></a>
                <ul style="display: block;">
                    <li class="active">
                        <a href="<c:url value="/monitor/monitorListQry.action"/>" title="監控標的總覽"><span>監控標的總覽</span></a>
                    </li>
                    <li class="active">
                        <a href="<c:url value="/monitor/alertListQry.action"/>" title="告警通知記錄查詢"><span>告警通知記錄查詢</span></a>
                    </li>
                    <li class="active">
                        <a href="<c:url value="/monitor/alertUserListQry.action"/>" title="通知人員設定"><span>通知人員設定</span></a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <span class="minifyme" data-action="minifyMenu">
		<i class="fa fa-arrow-circle-left hit"></i>
    </span>
</aside>
