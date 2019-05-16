<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">


	$(function() {	
		$( 'span:contains("�� ����")' ).on("click" , function() {
			//fncGetList($(this).children().val());
			fncGetList('${resultPage.currentPage-1}');
		});

		
		$( "span:contains('${ i }')" ).on("click" , function() {
			fncGetList($(this).children().val());
		});
	
		
		$( 'span:contains("���� ��")' ).on("click" , function() {
			fncGetList('${resultPage.endUnitPage+1}');
		});
	});	

</script>



<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
	�� ����
</c:if>

<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
	<span>�� ����
			<input type="hidden" name="menu" value="${resultPage.currentPage-1}"></span>
</c:if>


<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
	<span>${ i }
			<input type="hidden" name="menu" value="${ i }"></span>
</c:forEach>


<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
	���� ��
</c:if>

<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
	<span>���� ��<span>
</c:if>

