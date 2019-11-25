<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
    <c:set var="mo" value="${modifyViewMap.modifyView }" />
    <c:set var="review_imageFileName" value="${modifyViewMap.fileName }" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/review/css/review_style.css">
<title>Insert title here</title>
<style type="text/css">
th{
width: 200px;
}
</style>

</head>
<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="${contextPath}/resources/admin/assets/libs/flot/excanvas.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.time.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function readURL(input,id) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  reader.onload = function (e) {
		  if(id =='main'){
	   $('#preview').attr('src', e.target.result);  
		  }else{
			  $("#preview"+id).attr('src', e.target.result);  
		  }
	}
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	

function writeCheck()
  {
   var form = document.modifyform;
   
   if( !form.review_title.value ) 
   {
    alert( "제목을 입력해주세요." ); 
    form.review_title.focus();   
    return;
   }
   
   if( !form.review_content.value )
   {
    alert( "내용을 입력해주세요." );
    form.review_content.focus();
    return;
   }
 
  form.submit();
  }

</script>
<body>
<br><br><br>
<center>
<table class="review_table">
	<form action="${contextPath}/notice/review/modify.do" method="post" enctype="multipart/form-data" name="modifyform">
	<input type="hidden" name="review_num" value="${mo.review_num }" />
	<input type="hidden" name="pro_code" value="${mo.pro_code }" />
		<tr>
			<th class="left" >글번호</th>
			<td colspan="2">${mo.review_num }</td>
		</tr>
		
		<tr>
			<th class="left">상품명</th>
			<td colspan="2">${mo.pro_name }</td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td colspan="2">${mo.member_id }</td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="2"><input type="text" name="review_title" 
			   value="${mo.review_title }" size="50" style="border: none;" /></td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="2"><textarea type="text" name="review_content" rows="30" cols="100" 
			style="width:100%; height: 400px; border: none; resize: none; vertical-align: top;">${mo.review_content }</textarea></td>
		</tr>
		
		<tr>
			<th class="left">현재 사진</th>
			<td colspan="2"><img width=200 src="${contextPath}/thumbnails.do?review_num=${mo.review_num}&fileName=${review_imageFileName}" ></td>
			<input type="hidden" name="originalFileName" value="${review_imageFileName }" />
			
		</tr>
			<tr>
				<th class="left">사진수정</th>
				<td colspan="2"><input type="file" name="review_image" onchange="readURL(this,this.id);"/></td>
			</tr>
   			
   			<tr>
			<th>미리보기</th>
			<td colspan="2">
				<div id="image_list">
					<img id="preview" src="#" width=200 height=200 />
				</div>
			</td>
			</tr>
   		
		<tr>
			<td colspan="2"><input type="button" value="수정완료" OnClick="javascript:writeCheck();" />
				&nbsp;&nbsp;<a href="list.do" onclick="return confirm('이 창에서 벗어나면 수정사항은 저장되지 않습니다. 목록으로 돌아가시겠습니까?');">목록으로 돌아가기</a>
		</tr>
		
	</form>
</table>
</center>

</body>
</html>