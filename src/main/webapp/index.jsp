<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#search").click(function() {
	    let ad_idx = $("#ad_idx").val();
	    alert(ad_idx);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/search.do",
			data : {
			"ad_idx":ad_idx
            },
			success : function(data) {
                if(data==""){
         			$("#seachdata").html("등록되어 있지 않은 번호입니다.").css("color","red");
         		}else{
         		    alert(JSON.stringify(data));
         			let html = "<h2>민원 데이터</h2><ul>";
         			data.forEach(function(dgCompDTO) {
                    html += "<li>" + dgCompDTO.ad_idx + " - " + dgCompDTO.someField + "</li>";
                    // 민원 데이터 필드가 여러 개인 경우 추가로 표시
                    // html += "<li>" + dgCompDTO.ad_idx + " - " + dgCompDTO.someField + " - " + dgCompDTO.anotherField + "</li>";
                                                });
                                                html += "</ul>";
                                                $("#result").html(html).css("color", "green");
			},
			error : function() {
				alert('error');
			}
		});
	});
});
</script>
<head>
    <title>고객번호와 이미지 매칭 예제</title>
</head>
<body>
    <a href="<%=request.getContextPath()%>/search.do">상세검색</a>
    <a href="<%=request.getContextPath()%>/table.do">테이블</a>


</body>
</html>