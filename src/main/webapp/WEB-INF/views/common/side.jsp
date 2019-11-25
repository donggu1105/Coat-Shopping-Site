<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script>
   
      $(document).ready(function(){
         
         $('#keyword').change(function(){
               
         var keyword=$(this).val();
         
               $('#products').load('${contextPath}/product/productlist.do #products',{
                     "keyword5" : keyword   
               });
               $('#change_page').load('${contextPath}/product/productlist.do #change_page',{
                "keyword5" : keyword   
          });
              });
      });

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	input[name=price_type] {
		display: none;
	}
	input[name=price_type]:hover + label{
		cursor: pointer;
	}
	input[name=color_type]{
		display: none;
	}
	input[name=color_type] + label{
		margin: 0;
		padding: 0;
	}
	input[name=color_type]:hover + label{
		cursor: pointer;
		color:#FF084E}
		.hov-btn3:hover {
  border-color: #FF084E;
  background-color: #FF084E;
  color: #fff;
}
.filter-link:hover {
  color: #FF084E;
  text-decoration: none;

}

.filter-link-active {
  color: #FF084E;


}
.show-search:hover:after,
.show-filter:hover:after {
  background-color: #FF084E;
  border-color: #FF084E;
}
	
</style>

</head>
<body>

	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				

				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						 Filter
					</div>

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>
				
				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>

						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search"
						id="keyword">
					</div>	
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Sort By
							</div>






  <div id="radioboxs">
   <input type="radio" name="list_type" id="list_type1" value="price_asc">
   <label for="list_type1" class="list_type">가격낮은순</label>   
   <input type="radio" name="list_type" id="list_type2" value="price_desc">
   <label for="list_type2" class="list_type">가격높은순</label>
   <input type="radio" name="list_type" id="list_type3" value="input_asc">
   <label for="list_type3" class="list_type">오래된상품순</label>
   <input type="radio" name="list_type" id="list_type4" value="input_desc">
   <label for="list_type4" class="list_type">최신상품순</label>
   <input type="radio" name="list_type" id="list_type5" value="name_asc">
   <label for="list_type5" class="list_type">상품명</label>
   <input type="radio" name="list_type" id="list_type6" value="count_desc">
   <label for="list_type6" class="list_type">조회수</label>
</div> 




						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Price
							</div>

							<ul>
								<li class="p-b-6">
									<input type="radio" name="price_type" id="price_type1" value="all">
									<label for="price_type1" class="filter-link stext-106 trans-04 ">
										All
									</label>
								</li>

								<li class="p-b-6">
									<input type="radio" name="price_type" id="price_type2" value="20000">
									<label for="price_type2" class="filter-link stext-106 trans-04">
										20.000원 ~ 50.000원
									</label>
								</li>

								<li class="p-b-6">
									<input type="radio" name="price_type" id="price_type3" value="50000">
									<label for="price_type3" class="filter-link stext-106 trans-04">
										50.000원 ~ 80.000원
									</label>
								</li>

								<li class="p-b-6">
									<input type="radio" name="price_type" id="price_type4" value="80000">
									<label for="price_type4" class="filter-link stext-106 trans-04">
										80.000원 ~ 110.000원
									</label>
								</li>

								<li class="p-b-6">
									<input type="radio" name="price_type" id="price_type5" value="110000">
									<label for="price_type5" class="filter-link stext-106 trans-04">
										110.000원 ~ 140.000원
									</label>
								</li>

								<li class="p-b-6">
									<input type="radio" name="price_type" id="price_type6" value="140000">
									<label for="price_type6" class="filter-link stext-106 trans-04">
										140.000원 ~
									</label>
								</li>
							</ul>
						</div>



						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Color
							</div>

							<ul>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #CEC297;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type1" value="진베이지">
									<label for="color_type1" class="filter-link stext-106 trans-04">
										진 베이지
									</label>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #5C5E5C;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type2" value="카키그레이">
									<label for="color_type2" class="filter-link stext-106 trans-04">
										카키그레이
									</label>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #F7F3E8;">
										<i class="zmdi zmdi-circle-o"></i>
									</span>

									<input type="radio" name="color_type" id="color_type3" value="화이트">
									<label for="color_type3" class="filter-link stext-106 trans-04">
										화이트
									</label>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #EEE6C0;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type4" value="연베이지">
									<label for="color_type4" class="filter-link stext-106 trans-04">
										연베이지
									</label>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #94834B;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type5" value="그레이베이지">
									<label for="color_type5" class="filter-link stext-106 trans-04">
										그레이베이지
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #12254E;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type6" value="네이비">
									<label for="color_type6" class="filter-link stext-106 trans-04">
										네이비
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #00A6BA;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type7" value="딥에메랄드">
									<label for="color_type7" class="filter-link stext-106 trans-04">
										딥에메랄드
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #650219;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type8" value="와인">
									<label for="color_type8" class="filter-link stext-106 trans-04">
										와인
									</label>
								</li>
								
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #ECE3DA;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type9" value="크림">
									<label for="color_type9" class="filter-link stext-106 trans-04">
										크림
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #00BAF7;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type10" value="스카이">
									<label for="color_type10" class="filter-link stext-106 trans-04">
										스카이
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #BA90DE;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type11" value="라벤더">
									<label for="color_type11" class="filter-link stext-106 trans-04">
										라벤더
									</label>
								</li>
					
							</ul>
						</div>

						<div class="filter-col4 p-b-27">
							
							<div class="mtext-102 cl2 p-b-15">
								<Br>
							</div>
							
							<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #E1E5E6;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type12" value="라이트 그레이">
									<label for="color_type12" class="filter-link stext-106 trans-04">
										라이트 그레이
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #CEB384;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type13" value="베이지">
									<label for="color_type13" class="filter-link stext-106 trans-04">
										베이지
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #CEB384;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type14" value="베이지 체크">
									<label for="color_type14" class="filter-link stext-106 trans-04">
										베이지 체크
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #F78DAB;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type15" value="핑크">
									<label for="color_type15" class="filter-link stext-106 trans-04">
										핑크
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #F4C4BE;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type16" value="연핑크">
									<label for="color_type16" class="filter-link stext-106 trans-04">
										연핑크
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #F8F0DF;">
										<i class="zmdi zmdi-circle-o"></i>
									</span>

									<input type="radio" name="color_type" id="color_type17" value="아이보리">
									<label for="color_type17" class="filter-link stext-106 trans-04">
										아이보리
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #BAB0A7;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type18" value="오트밀">
									<label for="color_type18" class="filter-link stext-106 trans-04">
										오트밀
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type19" value="블랙">
									<label for="color_type19" class="filter-link stext-106 trans-04">
										블랙
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #86532C;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type20" value="카멜">
									<label for="color_type20" class="filter-link stext-106 trans-04">
										카멜
									</label>
								</li>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #A5A5A5;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type21" value="그레이">
									<label for="color_type21" class="filter-link stext-106 trans-04">
										그레이
									</label>
								</li>
								

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #884212;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<input type="radio" name="color_type" id="color_type22" value="브라운">
									<label for="color_type22" class="filter-link stext-106 trans-04">
										브라운
									</label>
								</li>
							
							
							
							
							
							
							
							
						</div>
						
						
						
					</div>
				</div>
			</div>

		
		
		
		
		
		
		
		
		
		
		
		
		

		

</body>
</html>