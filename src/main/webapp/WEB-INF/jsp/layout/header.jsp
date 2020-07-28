<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<header id="header">
    <div id="logo-group">
        <span id="logo"> <img src="<c:url value="/img/logo.png"/>" alt="台灣大哥大運算雲"> </span>
    </div>

    <!-- pulled right: nav area -->
    <div class="pull-right">
        <ul class="header-dropdown-list hidden-xs">
            <li>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span> ${userSession.userInfoDto.name} </span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li>
                        <a href="#" class="padding-10 padding-top-0 padding-bottom-0" data-action="changeContact">
                            <i class="fa fa-pencil-square-o fa-lg"></i> <strong>修改聯絡人</strong>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="padding-10 padding-top-0 padding-bottom-0" data-action="changePwd">
                            <i class="fa fa-key fa-lg"></i> <strong>變更登入密碼</strong>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="padding-10 padding-top-0 padding-bottom-0" data-action="prefSetting">
                            <i class="fa fa-cog fa-lg"></i> <strong>選項設定</strong>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="padding-10 padding-top-0 padding-bottom-0" data-action="userLogout">
                            <i class="fa fa-sign-out fa-lg"></i> <strong>登出</strong>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- end pulled right: nav area -->
</header>

<script>
    $(document).ready(function() {

        var contactValidatorRule = {
            errorElement : "div",
            highlight: function(element) {
                $(element).addClass("input-has-error");
            }, unhighlight: function(element) {
                $(element).removeClass("input-has-error");
            },
            rules : {
                name : "required",
                mblNbr : {
                    required : true,
                    minlength : 10,
                    digits : true
                },email : {
                    required : true,
                    email : true
                }
            },messages : {
                name : "請輸入姓名",
                mblNbr : {
                    required : "請輸入行動電話",
                    minlength : "長度不能小於10個字",
                    digits : "請輸入數字"
                },email : "請輸入Email"
		    }
        };

        $.validator.addMethod("regex", function(value, element, regexpr) {
            return regexpr.test(value) || value=="";
        }, "請輸入『數字、英文小寫、英文大寫』至少各一個");

        var pwdValidatorRule = {
            errorElement : "div",
            highlight: function(element) {
                $(element).addClass("input-has-error");
            }, unhighlight: function(element) {
                $(element).removeClass("input-has-error");
            },
            rules : {
                pwd : {
                    required:true,
                    minlength : 6
                },
                newpwd : {
                    required : true,
                    minlength : 8,
                    regex: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/
                },newpwd_again : {
                    required : true,
                    minlength : 8,
                    equalTo: "#newpwd"
                }
            },messages : {
                pwd : {
                    required : "請輸入原密碼",
                    minlength : "長度不能小於8個字"
                },
                newpwd : {
                    required : "請輸入新密碼",
                    minlength : "長度不能小於8個字"
                },newpwd_again : {
                    required : "請再次輸入新密碼",
                    minlength : "長度不能小於8個字",
                    equalTo : "輸入新密碼不一致"
                }
		    }
        };

        $("[data-action=changeContact]").click(function(e) {
        e.preventDefault();
            $.get("<c:url value="/user/contact/getContactInfo.action"/>", function(page){
                $.dialogBox({
                    title: "修改技術聯繫人",
                    titleIconCss: "fa-pencil-square-o",
                    bodyContent: page,
                    runScript : function() {
                        contactValidatorRule.submitHandler = function(form) {
                            $(form).ajaxSubmit({
                                type: "POST",
                                url : "<c:url value="/user/contact/updateContact.action"/>",
                                success : function(data) {
                                    if(data.responseType != "SUCCESS"){
                                        $().toastmessage("showErrorToast", data.message);
                                    }else{
                                        $.get("<c:url value="/dashboard/showCurrentStatus.action"/>", function(page){
                                            $("#currentStatusDiv").html(page);
                                        });
                                        $().toastmessage("showSuccessToast", data.message);
                                    }
                                }
                            });
                            $.fancybox.close();
                        };
                        $("#dialogBox #editContactForm").validate(contactValidatorRule);
                    },buttonList: [{
                        label: "確 定",
                        buttonCss: "btn-success",
                        buttonClick: function(){
                            $("#dialogBox #editContactForm").submit();
                        }
                    },{
                        label: "取 消",
                        buttonClick: function(){
                            $.fancybox.close();
                        }
                    }]
                });
            })
        });

        $("[data-action=changePwd]").click(function(e) {
        e.preventDefault();
            $.get("<c:url value="/user/editpwd/getEditpwd.action"/>", function(page){
                $.dialogBox({
                    title: "變更密碼",
                    titleIconCss: "fa-key",
                    bodyContent: page,
                    runScript : function() {
                    pwdValidatorRule.submitHandler = function(form) {
                            $(form).ajaxSubmit({
                                type: "POST",
                                url : "<c:url value="/user/editpwd/updateEditpwd.action"/>",
                                success : function(data) {
                                    if(data.responseType != "SUCCESS"){
                                        $().toastmessage("showErrorToast", data.message);
                                    }else{
                                        $().toastmessage("showSuccessToast", data.message);
                                    }
                                }
                            });
                            $.fancybox.close();
                        };
                        $("#dialogBox #editPwdForm").validate(pwdValidatorRule);
                    },buttonList: [{
                        label: "確 定",
                        buttonCss: "btn-success",
                        buttonClick: function(){
                            $("#dialogBox #editPwdForm").submit();
                        }
                    },{
                        label: "取 消",
                        buttonClick: function(){
                            $.fancybox.close();
                        }
                    }]
                });
            })
        });

        $("[data-action=prefSetting]").click(function(e) {
        e.preventDefault();
            $.get("<c:url value="/user/pref/loadPrefSetting.action"/>", function(page){
                $.dialogBox({
                    title: "選項設定",
                    titleIconCss: "fa-cog",
                    bodyContent: page,
                    buttonList: [{
                        label: "確 定",
                        buttonCss: "btn-success",
                        buttonClick: function(){
                            $.post("<c:url value="/user/pref/updatePrefSetting.action"/>", $("#dialogBox #editPrefForm").serialize(), function(data){
                                if(data.responseType != "SUCCESS"){
                                    $().toastmessage("showErrorToast", data.message);
                                }else{
                                    $().toastmessage("showSuccessToast", data.message);
                                }
                                $.fancybox.close();
                            });
                        }
                    },{
                        label: "取 消",
                        buttonClick: function(){
                            $.fancybox.close();
                        }
                    }]
                });
            })
        });

        $("[data-action=userLogout]").click(function(e) {
            $.dialogBox({
	            title: "登出",
	            titleIconCss: "fa-sign-out",
	            bodyContent: "<div style='width:240px; height:70px;'><p style='font-size:16px; line-height:60px; text-align:center;'>確定登出嗎?</p></div>",
	            buttonList: [{
	                label: "確 定",
	                buttonCss: "btn-success",
	                buttonClick: function(){
	                	$("<form method='POST' action='<c:url value="/login/logout.action"/>'><input type='hidden' name='_csrf' value='"+$("meta[name='_csrf']").attr("content")+"'></form>").appendTo("body").submit();
	                }
	            },{
	                label: "取 消",
	                buttonClick: function(){
	                    $.fancybox.close();
	                }
	            }]
	        });
        });

    });
</script>