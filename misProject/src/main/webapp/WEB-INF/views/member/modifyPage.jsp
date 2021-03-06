<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-uname">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">NAME</label> <input type="text"
								name='uname' class="form-control" value="${memberVO.memName}">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">memPw</label> <input type="text"
								name='uname' class="form-control" value="${memberVO.memPw}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">phone</label> <input type="text"
								name='uname' class="form-control" value="${memberVO.phone}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">email</label> <input type="text"
								name='uname' class="form-control" value="${memberVO.email}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">adr</label> <input type="text"
								name='uname' class="form-control" value="${memberVO.adr}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">adr2</label> <input type="text"
								name='uname' class="form-control" value="${memberVO.adr2}">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">ID</label> <input
								type="text" name="writer" class="form-control"
								value="${memberVO.memId}">
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/member/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
