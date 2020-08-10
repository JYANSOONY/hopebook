<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin Library List</title>
<link href="/../resources/admin/dist/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
</head>

	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
<body class="sb-nav-fixed"
	style="overflow-x: hidden; overflow-y: hidden">
	
</body>

<!-- Main content -->
<style>
.container {
  width: 70%;
  height: 70%;
  margin: 10px auto;
}
.outer {
  display: table;
  width: 100%;
  height: 100%;
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}
.centered {
  position: relative;
  display: inline-block;
 
  width: 50%;
}

ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 100%;
    font-family:"dotum";
    font-size:12px;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:82px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid #FFFFFF;
}
.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 1250px; 
    background: #FFFFFF;
}
.tab_content {
    padding: 5px;
    font-size: 12px;
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none
}
;
 #container {
    width: 249px;
    margin: 0 auto;
}




 </style>
 
<script type="text/javascript" src="js/mailPopup.js"></script>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

				
			
			<div class="box" >
			
				<div class="box-header with-border">
					<h3 class="box-title">회원정보 관리</h3>
				</div>
				<form name = "frm" method = "post" action = "email?command=senderEmail&email=${MemberVO.email}">
 				<div class="box-body">

<div>

<div id="container">
    <ul class="tabs">
        <li class="active" rel="tab1">기부회원</li>
        <li rel="tab2">일반회원</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        
        <table class="table table-bordered" id="user-table">
			<thead>
			<tr><th colspan="6" style = "text-align: center;">회원정보</th></tr>
			
			<tr>
			    <th style="width: 10px; text-align:center;"><input type = "checkbox" name = "donationCheck" ></th>
				<th style="width: 100px; text-align: center;">아이디</th>
				<th style="width: 100px;text-align: center;">이름</th>
				<th style="width: 100px;text-align: center;">이메일</th>
				<th style="width: 50px;text-align: center;">회원등급</th>
			</tr>
			</thead>
		
		<c:forEach items="${donation}" var="MemberVO" varStatus="status">
			<tbody >
			<tr style ="text-align:center;">
				<td><input type ="checkbox" value="${MemberVO.email}" name="email" id="donationEmail${status.count}" ></td>
				<td>${MemberVO.memId}</td>
				<td>${MemberVO.memName}</td>
				<td>${MemberVO.email}</td>	
				<c:if test = "${MemberVO.authority eq '2'}"><td id="donation">기부회원</td></c:if>
				
			</tr>
			</tbody>
		</c:forEach>
	</table> 
        
        </div>
        <!-- #tab1 -->
        <div id="tab2" class="tab_content">
         <table class="table table-bordered" id="user-table">
			<thead>
			<tr><th colspan="6" style = "text-align: center;">회원정보</th></tr>
			<tr>
			    <th style="width: 10px; text-align:center;"><input type = "checkbox" name = "Check" ></th>
				<th style="width: 100px; text-align: center;">아이디</th>
				<th style="width: 100px;text-align: center;">이름</th>
				<th style="width: 100px;text-align: center;">이메일</th>
				<th style="width: 50px;text-align: center;">회원등급</th>
			</tr>
			</thead>
		
		<c:forEach items="${memberList}" var="Member" varStatus="status">
			<tbody >
			<tr style ="text-align:center;">
				<td><input type ="checkbox" value="${Member.email}" name="email" id="memberEmail${status.count}" ></td>
				<td>${Member.memId}</td>
				<td>${Member.memName}</td> 
				<td>${Member.email}</td>	
		 		<c:if test = "${Member.authority eq '1'}"><td id="member">일반회원</td></c:if>	
				
			</tr>
			</tbody>
		</c:forEach>
		</table> 
        
        </div>
        <!-- #tab2 -->
    </div>
    <!-- .tab_container -->
</div>
<!-- #container -->

</div>
		    <button type = "button" class="btn btn-danger" onclick="sendEmailForm()" style = "float : right">메일전송</button> 
</div>
			 </form>

			<section class="pt-0">
		<div class="container">
		<div class="outer">
    <div class="inner">
    <div class="centered">
						<ul class="pagination justify-content-center">
						<c:if test="${paging.pageNum > 1}">
							<li class="page-item"><a class ="page-link" href="admin?command=senderEmailListFormAction&pageNum=${paging.pageNum - 1}">Prev</a></li>
						
							
						</c:if>	
							<c:forEach begin="${paging.firstPage}"
                                       end="${paging.lastPage}" var="idx">
                                       
                                       <c:choose>
                                          <c:when test="${idx == paging.pageNum}">
                                             <li class="page-item active"> <span class="page-link bg-grad">${idx}</span></li>
                                          </c:when>
                       
                                          <c:otherwise>
                                             <li class="page-item"><a class ="page-link"
                                                href="admin?command=senderEmailListFormAction&pageNum=${idx}">${idx}</a></li>
                                          </c:otherwise>
                                          
                                       </c:choose>
                                    </c:forEach>
						
							<c:if test="${paging.numOfPage != paging.pageNum}">
                                    <li class="page-item"><a class = "page-link" href="admin?command=senderEmailListFormAction&pageNum=${paging.pageNum + 1}">Next</a></li>   
                                    </c:if>
							

						</ul>
			</div>
			</div>
			</div>
		</div>
	</section>
			</div>

		
			</div>
			
			
		</div> 
		<!--/.col (left) -->

	
	<!-- /.row -->
</section>
<!-- /.content -->
<!-- </div> -->
<!-- /.content-wrapper -->

<script>

$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});

</script>

<script>
//올체크

$("input[name=Check]").click(function(){
	
 	var checkCount = $("input[name='email']").length
 	
 	for (var count = 0; count < $("input[name='email']").length; count++) {
		
 	$("#donationEmail"+count).prop("disabled", true);
 	
	}
 	
	var chk = $(this).is(":checked");
	
	if(chk){
		$("input[name='email']").prop("checked", true);
	} else{
		$("input[name='email']").prop("checked", false);
	}
}); 


 $("input[name=donationCheck]").click(function(){
		
	 	var checkCount = $("input[name='email']").length
	 	
	 	for (var count = 0; count < $("input[name='email']").length; count++) {
			
	 	$("#memberEmail"+count).prop("disabled", true);
	 	
		}
	 
	 	
		var chk = $(this).is(":checked");
		
		if(chk){
			$("input[name='email']").prop("checked", true);
		} else{
			$("input[name='email']").prop("checked", false);
		}
	}); 

function sendEmailForm(){

	 var total_cnt=0;
	 var email = new Array();
	 $('input:checkbox[name = "email"]').each(function(){
		 if(this.checked){
			 email[total_cnt] = this.value;
			 total_cnt++;
		 }
	 });
	 
	 
     var popUrl ="/admin?command=mailPopupForm&email="+email;
     var popOption = "width=650px, height=550px, resizable=no, location=no, top=300px, left=300px;"
        
        window.open(popUrl,"메일전송폼 ",popOption);    
 }

    </script>
<script type="text/javascript">
   $(document).ready(function(){
	   if($('.send').trigger('click'))
		$('.treevie ').addClass("active");
	    $('#m2').attr('style','gray;')
	}); 
</script>

<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2020</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
		</html>