<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#customerSelect").change(function() {
	    let ad_idx = $("#customerSelect").val();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/searchcom.do",
			data : {
			"ad_idx":ad_idx
            },
			success : function(data) {
                if(data==""){
         			$("#seachdata").html("등록되어 있지 않은 번호입니다.").css("color","red");
         		}else{
        		    data.forEach(function(data) {
             		    var tableBody = $("#dataTable tbody");
                        tableBody.empty();
                        var row = "<tr>";
                        row += "<td>" + data.re_idx + "</td>";
                        row += "<td>" + data.re_time + "</td>";
                        row += "<td>" + data.com_div + "</td>";
                        row += "<td>" + data.prog + "</td>";
                        row += "<td>" + data.cb + "</td>";
                        row += "<td>" + data.tex + "</td>";
                        row += "<td>" + data.result2 + "</td>";
                        row += "</tr>";
                        tableBody.append(row);
                    });
         		}
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
    <h1>고객번호와 이미지 매칭</h1>
    <select id="customerSelect" name="select">
            <option value="">고객번호 선택</option>
            <c:forEach items="${dglist}" var="dg">
                <option  value="${dg.num}">${dg.num}</option>
            </c:forEach>
        </select>
        <button type="button" id="searchcomp"> 조회</button>
    <div>
       <table id="dataTable" border="1px">
               <thead>
                   <tr>
                       <th>접수번호</th>
                       <th>접수시간</th>
                       <th>민원구분</th>
                       <th>진행상태</th>
                       <th>구경</th>
                       <th>재질</th>
                       <th>처리결과</th>
                   </tr>
               </thead>
               <tbody>
               </tbody>
           </table>
    </div>
    <div id="imageContainer">
        <span id="seachimg">
        </span>
    </div>
    <script>
            // 셀렉트 박스가 변경되었을 때 이미지를 변경하는 함수
            document.getElementById('customerSelect').addEventListener('change', function() {
                var selectedValue = this.value;
                var imageContainer = document.getElementById('imageContainer');

                // 선택한 고객번호를 서버로 전달하여 이미지 갱신
                // (여기서는 AJAX를 사용하여 비동기적으로 처리 가능)
                // ...

                // 예시로 이미지 경로를 동적으로 변경하는 코드
                if (selectedValue) {
                	imageContainer.innerHTML = '<img src="/resources/images/' + selectedValue + '.png" alt="고객 이미지">';

                } else {
                	imageContainer.innerHTML = '<p>이미지가 없습니다.</p>';
                }



               console.log(selectedValue);
            });

            document.getElementById('customerSelect').addEventListener('change', function() {
                var ad_idx = this.value;
              		$.ajax({
               			type : "post",
               			url : "${pageContext.request.contextPath}/searchcom.do",
               			data : {
               			"ad_idx":ad_idx
                        },
            			success : function(data) {
                            if(data==""){
                     			$("#seachdata").html("등록되어 있지 않은 번호입니다.").css("color","red");
                     		}else{

                         	    var tableBody = $("#dataTable tbody");
                                tableBody.empty();
                     		    $.each(data, function(index, item) {
                                    var row = "<tr>";
                                    row += "<td>" + item.re_idx + "</td>";
                                    row += "<td>" + item.re_time + "</td>";
                                    row += "<td>" + item.com_div + "</td>";
                                    row += "<td>" + item.prog + "</td>";
                                    row += "<td>" + item.cb + "</td>";
                                    row += "<td>" + item.tex + "</td>";
                                    row += "<td>" + item.result2 + "</td>";
                                    row += "</tr>";
                                    tableBody.append(row);
                                });
                     		}
               			},
                		error : function() {
           	   		    	alert('error');
           	    	}
           	    });
            });
        </script>
    <a href="<%=request.getContextPath()%>/table.do">테이블</a>


</body>
</html>