<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>상품 리스트</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	
	function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
	}
	
	
	 $(function() {
		$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
			fncGetList(1);
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				self.location ="/product/getProduct?prodNo="+$(this).children().val()+"&menu=${param.menu}";
				console.log ( $(this).children().val() );
				console.log (":::"+ $( ".ct_list_pop td:nth-child(9)").html() );
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
			
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
		$( "td:contains('배송하기')" ).on("click" , function() {
			self.location ="/purchase/updateTranCode?prodNo="+$(this).parent().children("td:nth-child(3)").children().val()+"&tranCode="+$(this).parent().children("td:nth-child(9)").children().val();
			console.log ( "확인1 :: "+$(this).parent().children("td:nth-child(3)").children().val() );
			console.log ( "확인2 :: "+$(this).parent().children("td:nth-child(9)").children().val() );
		
		});
		
		$( "#price:contains('가격')" ).on("click" , function() {
			self.location ="/product/listProduct?menu=${param.menu}";
			console.log ( "/product/listProduct?menu=${param.menu}");
		});
				
			
	 });	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

	<form name="detailForm">
		
	<input type="hidden" name="menu" value="${param.menu}">
	
		
		<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="15" height="37">
					<img src="/images/ct_ttl_img01.gif" width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">
								<c:choose>
									<c:when test="${ param.menu != 'search' }">
										상품관리
									</c:when>
									<c:otherwise>
										상품목록조회 
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif" width="12" height="37" /></td>
			</tr>
		</table>


		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td align="right">

					<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : "" }" class="ct_input_g" 
							style="width: 200px; height: 20px"></td>
				<td align="right" width="70">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								검색</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>


		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
			<tr>
				<td colspan="11">
					전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
				</td>
			</tr>
			<tr>
				<td id="price" colspan="11">
					가격
				</td>
			</tr>
			<tr>
				<td class="ct_list_b" width="100">No</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b" width="150">상품명</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b" width="150">가격</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b">등록일</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b">현재상태</td>
			</tr>
			<tr>
				<td colspan="11" bgcolor="808285" height="1"></td>
			</tr>
			
				

		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="ct_list_pop">
				<td align="center">${ i }</td>
				<td></td>
				<td align="center">${product.prodName} 
					<input type="hidden" value="${product.prodNo}"/>
				</td>
				<td></td>
				<td align="right">${product.price}원</td>
				<td></td>
				<td align="center">${product.manuDate}</td>
				<td></td>
				<td align="left">
					<input type="hidden" value="${product.proTranCode}"/>
				
				
				<c:choose>
					<c:when test="${ empty product.proTranCode || product.proTranCode eq '0'}">
							판매 중 
					</c:when>
					
					<c:when test="${product.proTranCode eq '1' }">
							판매완료
					 	
						<c:if test="${param.menu =='manage'}">
							[배송하기]
						</c:if>
					</c:when>
							
					<c:otherwise>
						<c:choose>
							<c:when test="${param.menu eq 'manage'}"> 
								배송 완료(품절)
							</c:when>
							
							<c:otherwise>
								품절 
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
					
				

				</td>
			</tr>

			<tr>
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>
			</c:forEach>
		</table>


		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
			<tr>
				<td align="center">
					 <input type="hidden" id="currentPage" name="currentPage" value=""/>
						<jsp:include page="../common/pageNavigator.jsp"/>	
						
    			</td>
			</tr>
		</table>
	</form>

</div>
</body>
</html>
