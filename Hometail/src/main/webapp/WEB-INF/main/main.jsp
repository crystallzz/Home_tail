<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Mosaic - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--     <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet"> -->
    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/ionicons.min.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/food.css">
  </head>
<body>

<%-- Header 영역 --%>
<tiles:insertAttribute name="header"/>
<!-- Content 영역 -->
<tiles:insertAttribute name="content"/>
<!-- footer 영역 -->
<tiles:insertAttribute name="footer"/>
<!-- JS here -->
 <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="../js/google-map.js"></script> -->
  <script src="../js/main.js"></script>
  <script type="text/javascript">
    $(function(){
    	$('#logBtn').click(function(){
    		let id=$('#id').val();
    		if(id.trim()=="")
    		{
    			$('#id').focus();
    			return;
    		}
    		let pwd=$('#pwd').val();
    		if(pwd.trim()=="")
    		{
    			$('#pwd').focus();
    			return;
    		}
    		
    		$.ajax({
    			type:'POST',
    			url:'../main/login.do',
    			data:{"id":id,"pwd":pwd},
    			success:function(res)
    			{
    				let no=res.trim();
    				alert(no);
    				if(no==1)
    				{
    					$('#result').text("ID가 존재하지 않습니다");
    					$('#id').val("");
    					$('#pwd').val("");
    					$('#id').focus();
    				}
    				else if(no==2)
    				{
    					$('#result').text("비밀번호가 틀립니다");
    					$('#pwd').val("");
    					$('#pwd').focus();
    				}
    				else
    				{
    					$('#myModal').modal("hide");
    					$('#id').val("");
    					$('#pwd').val("");
    					$('#result').text("");
    					location.href="../main/main.do";
    				}
    			}
    		});
    	});
	    	$('.msg_content').click(function(){
// 	    	 var content = $(this).text();
	    	 var name = $(this).attr("data-value");
	    	 var time = $('.reserve_time').val();
	    	 var reserve_day = $('.reserve_day').val();
	    	 var msg ='안녕하세요 ${sessionScope.name}님 저희 '+name+'의 봉사 예약을 진심으로 감사드립니다.'
	    	 +'주소,날짜,시간은 예약하신 시간으로 설정되었습니다.';
	    	 var loc = $('.msg_loc').text();
	    	 console.log('이름'+name);
	    	 console.log('위치'+loc);
	    	 console.log('시간'+time);
	    	 console.log('날짜'+reserve_day);
	    	 console.log('메시지'+msg);
	    	 $('#detail_msg').text(msg);	    	 
	    	 $('#detail_name').text(name);
	    	 $('#detail_loc').text(loc);
	    });
    });
    </script>
    <div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4>Login</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <table class="table">
         <tr>
           <td width=25% class="text-right">ID</td>
           <td width=75%>
             <input type=text id="id" class="input-sm" size=15>
           </td>
         </tr>
         <tr>
           <td width=25% class="text-right">PW</td>
           <td width=75%>
             <input type=password id="pwd" class="input-sm" size=15>
           </td>
         </tr> 
         <tr>
           <td class="text-center" colspan="2">
             <span style="color:red" id="result"></span>
           </td>
         </tr>
        </table>
      </div>
      <div class="modal-footer">
        <input type=button class="btn btn-success" value="로그인" id="logBtn">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>					
</div>						
							
<div id="mailbox" class="modal fade" role="dialog">
    <div class="modal-dialog" style="max-width:1000px;  width: 1000px;">
<!--      Modal content -->	
    <div class="modal-content" style="border: 4px solid gold;">
	<img src="../message_icon.png" style="margin-left: 350px;" class="nav-item" id="sootag" width=100 height=80>
      <div class="modal-header">
        <h4>${sessionScope.name} Message 함</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>				
      <p></p>				
      <div class="modal-body">
        <table class="table">
         	<tr>			
         		<th>도착일</th>
         		<th>내용</th>			
         		<th>위치</th>			
         		<th>전화번호</th>		
         	</tr>					
        	<c:forEach var="vo" items="${list }">
        	<input type="hidden" class="reserve_time" value="${vo.time}">
        	<input type="hidden" class="reserve_day" value="${vo.reserve_day}">
         	<tr>														
         		<td>													
         			<c:if test="${count>=1 }">							
	        			<sup style="color: red;">new</sup>				 
	        		</c:if>												
         			<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>  
         		</td>													
         		<td>													
         			<a class="msg_content" data-toggle="modal" data-target="#mailbox_detail" data-value="${vo.hospital_name}">안녕하세요 ${sessionScope.name } ${vo.hospital_name }</a>
<%--        			data-toggle="modal" data-target="#mailbox_detail"   --%>
         		</td>													
       	  		<td class="msg_loc">													
         			${vo.loc}											
         		</td>													
         		<td>													
         			${vo.tel}		
         		</td>		
         	</tr>			
         </c:forEach>		
        </table>			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div id="mailbox_detail" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content" style="border: 4px solid black">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
		<table class="table">
			<tr>
				<th width=20% class="text-center">보낸이</th>
				<td class="text-left" id="detail_name">
				</td>
			</tr>
			<tr>
				<th>
					내용
				</th>
			</tr>
			<tr>
				<td colspan="3" id="detail_msg">
				
				</td>
<!-- 				<td id="detail_loc"> -->
<!-- 				</td> -->
			</tr>
		</table>
      </div>
      <div class="modal-footer">
       	 	<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
