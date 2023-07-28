<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

</script>

</script>
<head>
</head>
<body>

<select id="customerSelect" name="select">
        <option value="">고객번호 선택</option>
        <c:forEach items="${dglist}" var="dglist">
            <option  value="${dglist.ad_idx}">${dglist.ad_idx}</option>
        </c:forEach>
    </select>
    <button type="button" id="searchcomp"> 조회</button>

    <!-- Section-->
    <section class="py-5">
        <table border="1" style="width:800px">
            <thread>
            <tr>
            <th>고객번호</th>
            <th>연도</th>
            <th>월</th>
            <th>일</th>
            <th>민원구분</th>
            <th>작업상태</th>
            <th>구경</th>
            <th>재질</th>
            <th>처리결과2</th>
            </tr>
            </thread>
            <tbody>
                <c:forEach items="${dglist}" var="dglist">
                    <tr>

                        <td>${dglist.ad_idx}</td>
                        <td>${dglist.year1}</td>
                        <td>${dglist.month1}</td>
                        <td>${dglist.day1}</td>
                        <td>${dglist.com_div}</td>
                        <td>${dglist.prog}</td>
                        <td>${dglist.cb}</td>
                        <td>${dglist.tex}</td>
                        <td>${dglist.result2}</td>
                    </tr>
                    </c:forEach>
                </tbody>

        </table>
        <a href="table?pageNum=1">&laquo;</a>
    			<ul class="pagination">
                    <c:if test="${pageMaker.prev }">
                    	<li class="pagination_button">
                    		<a href='<c:url value="/tables/table?pageNum=${pageMaker.startPage - 1 }"/>'>Previous</a>
                    	</li>
                    </c:if>
                    <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                    	<li class="pagination_button">
                    		<a href='<c:url value="/tables/table?pageNum=${num }"/>'>${num}</a>
                    	</li>
                    </c:forEach>
                    <c:if test="${pageMaker.next }">
                    	<li class="pagination_button">
                    		<a href='<c:url value="/tables/table?pageNum=${pageMaker.endPage + 1 }"/>'>Next</a>
                        	</li>
                    </c:if>
                </ul>
    </section>
</body>
<html>