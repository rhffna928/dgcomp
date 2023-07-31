<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<head>
</head>
<style>
  .search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 500px;
  }
  .search_area select{
      height: 30px;
    width: 100px;
  }
  .search_area input{
      height: 30px;
    width: 350px;
  }
  .search_area button{
     width: 100px;
    height: 36px;
  }

</style>
<body>

    <a href="<%=request.getContextPath()%>/index.do">홈</a>
    <div class="search_area">
        <select name="searchType" id="searchType">
            <option>-----</option>
            <option name="ad_idx" value="고객번호">고객번호</option>
            <option name="result2"value="결과">결과</option>
        </select>
        <input type="text" name="keyword" id="keywordInput" value="${pageMaker.cri.keyword}"  placeholder="검색어를 입력해주세요" >
        <button type="button" id="searchkeyword">검색</button>
    </div>

    <!-- Section-->
    <section class="py-5">

        <table border="1" style="width:100%">
            <thread>
                <tr>
                    <th>고객번호</th>
                    <th>민원날짜</th>
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
                        <td>${dglist.year2}-${dglist.month2}-${dglist.day2}</td>
                        <td>${dglist.com_div}</td>
                        <td>${dglist.prog}</td>
                        <td>${dglist.cb}</td>
                        <td>${dglist.tex}</td>
                        <td>${dglist.result2}</td>
                    </tr>
                    </c:forEach>
                </tbody>

        </table>
    		<ul class="pagination">
                <c:if test="${pageMaker.prev}">
                   	<a href="${path}/table.do?pageNum=${pageMaker.startPage - 1 }">이전</a>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                  	<a href="${path}/table.do?pageNum=${num }">${num}</a>
                </c:forEach>
                <c:if test="${pageMaker.next }">
                   	<a href="${path}/table.do?pageNum=${pageMaker.endPage + 1 }">다음</a>
                </c:if>
            </ul>
            <form id="moveForm" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                <input type="hidden" name="searchType" value="${pageMaker.cri.searchType}">
            </form>

    </section>
</body>
<script>
$(document).ready(function() {
    $(".search_area button").on("click",function(e) {
        e.preventDefault();
        let keyword = $("input[name=keyword]").val();
        let searchType = $("input[name=searchType]").val();
        let st = $("select[name=searchType]").val();
        alert(st);


        location.href = "${path}/table.do?pageNum=1"+"&searchType="+st+"&keyword="+keyword;

        alert("요청성공");
    });
});
</script>
<html>