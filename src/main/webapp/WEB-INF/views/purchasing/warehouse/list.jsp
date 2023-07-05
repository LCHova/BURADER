<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../includes/header.jsp" %>

<style type="text/css">
html,body {width:100%;  }
body,div,ul,li{margin:0; padding:0;}
ul,li {list-style:none;}

/*tab css*/
.tab{float:left; width:500px; height:690px;}
.tabnav{font-size:0; width:252px; border:1px solid #ddd;}
.tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
.tabnav li a.active:before{background:#7ea21e;}  /*탭기능 버튼눌렀을때 눌렀따~~표시되는 css  */
.tabnav li a.active{border-bottom:1px solid #fff;} /*탭기능 버튼눌렀을때 눌렀따~~표시되는 css  */
.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
/* 위에 코드 없으면 탭버튼들이 안보임 모르겠음 왜인지는 ㅎㄷㄷ  */
.tabnav li a:hover, /*탭기능 버튼눌렀을때 눌렀따~~표시되는 css  */
.tabnav li a.active{background:#fff; color:#7ea21e; } /*탭기능 버튼눌렀을때 눌렀따~~표시되는 css  */
.tabcontent{padding: 20px; height:764px; width:1892px; border:1px solid #ddd; border-top:none;}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

// 탭기능
$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	  });
	  
	  
function openPopup() {
	window.open('./insert', 'warehousePopup', 'width=800, height=500, left=2000');
}

//체크박스 선택된 개수 출력
function getCheckedCnt()  {
	  // 선택된 목록 가져오기
	  var count = 'input[name="check"]:checked';
	  var selectedElements = document.querySelectorAll(count);
	  // 선택된 목록의 갯수 세기
	  var cnt = selectedElements.length;
	  
	  return cnt;  
	}
//2-1. '수정' 클릭
$(document).ready(function() {
$('.modify').click(function(){ 
	
	if($(this).hasClass('true')) {
		$(this).removeClass('true');	// 한번 더 수정이 안된다면 얘가 문제임 ! remove해서!
		
		// 배열 & 체크박스 변수 생성
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=check]:checked");
		
		// 체크박스 항목 개수 제어
		if(checkbox.length > 1){
			alert("하나의 항목만 수정이 가능합니다.");
			location.reload();
			return false;
		}else if($('input:checkbox[name="check"]:checked').length == 0){
			alert("수정할 항목을 선택해주세요.");
		}
			
		// 체크된 체크박스 값 가져오기
		checkbox.each(function(i) {

			var tr = checkbox.parent().parent().eq(i);	// checkbox의 부모는 <td>, <td>의 부모는 <tr>
			var td = tr.children();
			
			// 체크된 row의 모든 값 배열에 담기
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스, td.eq(1)이 ma_id
			// -> 배열 tdArr에 정보를 담음
			var whs_id = td.eq(1).text();
			tdArr.push(whs_id);	// tdArr[0] == ma_id
			
			$.ajax({
				url: "modify",
				type: "get",
				data: { whs_id:whs_id },
				success: function(data) {	// 기존데이터정보(orderVo) 받아옴 
	
					// 여기서 order_id를 이용해서 if문걸어가지고 같은 값일때 아래처럼 나오게하면될듯?!
					
					// orderVo에서 테이블 값 가져오기
				//	var order_date = data.order_date;
				//    console.log(order_date);
				//    console.log(order_date);
				$(data).each(function(idx, obj){
						var str = "";
						str += "<tr>";
						str += "<td><input type='checkbox' name='check'></td>";
						str += "<td>"+ obj.whs_id +"</td>";
						str += "<td><input type='text' id='whs_type' name='whs_type' value="+ obj.whs_type +" readonly></td>";
						str += "<td><input type='text' id='whs_tel' name='whs_tel' value="+ obj.whs_tel +"></td>";
						str += "<td>미사용<input type='radio' id='whs_status' name='whs_status' value='2'>사용<input type='radio' id='whs_status' name='whs_status' value='1'></td>";
						str += "<td><input type='text' id='whs_emp' name='whs_emp' value="+ obj.whs_emp +"></td>";
						// 담당직원 세션에 저장된 아이디 들고오기
						str += "</tr>";			
						$('table').prepend(str);
					});
				},
				error: function() {
					alert("error");
				}
				
			}); //ajax	
			
		}); // function(i)
   }
				// 2-2. '저장' 클릭 
			 	$('.update').click(function(){
					$('.modify').addClass('true');
					var whs_id = tdArr[0];
					var whs_type = $('#whs_type').val();
					var whs_tel = $('#whs_tel').val();
					var whs_status = $("input[name='whs_status']:checked").val();
					var whs_emp = $('#whs_emp').val();
	
								
					if(whs_id==="" || whs_type==="" ) {
						alert("모든 order_qty 입력해주세요.");
					} else {
						$.ajax({
							url: "modify",
							type: "post",
							dataType : "json",
							contentType : "application/json;charset=UTF-8",
							data: JSON.stringify({ 
								whs_id:whs_id,
								whs_type:whs_type,
								whs_tel:whs_tel,
								whs_status:whs_status,
								whs_emp:whs_emp
						   }),
							success: function() {
//		 						alert("자재코드 " + ma_id + ", 수정이 완료되었습니다.");
//		 						location.href="/purchasing/material/list";
								alert("발주코드 " + whs_id + ", 수정이 완료되었습니다. @success@" );
								location.href="/purchasing/warehouse/list";
								},
							error: function() {
								alert("발주코드 " + whs_id + ", 수정이 완료되었습니다. @er@ ");
								location.href="/purchasing/warehouse/list";
					    }
			   }); //ajax		
			
			} // if-else
				
		}); // update.click 
		
  }); // modify.click
  
//3-1. '삭제' 클릭
	$('#delete').click(function(){ 
			
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=check]:checked");
		
		// 체크된 체크박스 값을 가져옴
		checkbox.each(function(i) {

			// checkbox.parent()          : checkbox의 부모는 <td>
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값 배열에 담기
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스, td.eq(1)이 ma_id
			var whs_id = td.eq(1).text();
			tdArr.push(whs_id);	// tdArr[0]
        console.log(whs_id);
		}); // function(i)
		
	
		// 3-2. 체크된 데이터 컨트롤러 전달
		var whs_id = tdArr[0];
		
		$.ajax({
			url: "delete",
			type: "post",
			data: { whs_id:whs_id },
			success: function() {
				var result = confirm("품목코드 " + whs_id + "를 정말 삭제하시겠습니까?");
				if(result){
					alert("삭제가 완료되었습니다.");
					location.href="/purchasing/warehouse/list";
				}
			},
			error: function() {
				alert("삭제할 항목을 선택해주세요.");
			}
	    }); //ajax		
	
	}); // deleteForm.click
  
}); // jquery



</script>
</head>
<body>
<br>

	<h1 class="card-title">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">창고 리스트</font></font>
	</h1>
	
	<div>
	<ul class="nav nav-tabs tab-no-active-fill" role="tablist">
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2 active" id="stage1-tab" data-bs-toggle="tab" href="#stage1" role="tab" aria-controls="stage1" aria-selected="true">자재창고</a>
	</li>
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2" id="stage2-tab" data-bs-toggle="tab" href="#stage2" role="tab" aria-controls="stage2" aria-selected="false">상품창고</a>
    </li>
	</ul>								
	<div class="tab-content tab-no-active-fill-tab-content">
	
	<div class="tab-pane fade active show" id="stage1" role="tabpanel" aria-labelledby="stage1-tab">
	
	<c:if test="${emp_department.equals('구매팀') || emp_department.equals('Master')}">
		<div style=float:right;>
			<button class="btn btn-success add-button" type="button" onclick="openPopup();">창고등록</button>
			<button class="btn btn-success modify true">창고수정</button>
			<button class="btn btn-success" id="delete">창고삭제</button>
			<button class="btn btn-info insert update">저장</button>
		</div>
	</c:if> 
	
	<!-- 테이블 -->
	<table border="1" class="table table-hover table-bordered text-center">
		<tr>
			<th></th>
			<th>창고번호</th>
			<th>창고타입</th>
			<th>전화번호</th>
			<th>사용여부</th>
			<th>창고관리자</th>
		</tr>
		
		<c:forEach var="wh" items="${warehouseList}">
			<tr>
			<c:choose>
			   <c:when test="${wh.whs_type.equals('자재')}">
			   <td><input type="checkbox" name="check"></td>
		       <td>${wh.whs_id}</td>
		       <td>${wh.whs_type}</td>
		       <td>${wh.whs_tel}</td>
		       <td>
		       	 <c:choose>
		       		<c:when test="${wh.whs_status == 1}">사용중</c:when>
		       		<c:when test="${wh.whs_status == 2}">미사용</c:when>
		       	 </c:choose>
		       </td>
		       <td>${wh.whs_emp}</td>
		       </c:when>
		       </c:choose>
			</tr>
		</c:forEach>
	</table>
</div>
<!-- 2번째 탭 내용들  -->
<div class="tab-pane fade show" id="stage2" role="tabpanel" aria-labelledby="stage2-tab">
	
	<!-- 구매팀일때만 버튼 활성화 -->
	<c:if test="${emp_department.equals('구매팀')}">
		<div style=float:right;>
			<button class="btn btn-success add-button" type="button" onclick="openPopup();">창고등록</button>
			<button class="btn btn-success modify true">창고수정</button>
			<button class="btn btn-success" id="delete">창고삭제</button>
			<button class="btn btn-info insert update">저장</button>
		</div>
	</c:if> 
	
	
	<!-- 테이블 -->
	<table border="1" class="table table-hover table-bordered text-center">
		<tr>
			<th></th>
			<th>창고번호</th>
			<th>창고타입</th>
			<th>전화번호</th>
			<th>사용여부</th>
			<th>창고관리자</th>
		</tr>
		
		<c:forEach var="wh" items="${warehouseList}">
			<tr>
			<c:choose>
			   <c:when test="${wh.whs_type.equals('상품')}">
			   <td><input type="checkbox" name="check"></td>
		       <td>${wh.whs_id}</td>
		       <td>${wh.whs_type}</td>
		       <td>${wh.whs_tel}</td>
		       <td>
		       	 <c:choose>
		       		<c:when test="${wh.whs_status == 1}">사용중</c:when>
		       		<c:when test="${wh.whs_status == 2}">미사용</c:when>
		       	 </c:choose>
		       </td>
		       <td>${wh.whs_emp}</td>
		       </c:when>
		       </c:choose>
			</tr>
		</c:forEach>
	</table>
   </div>
 </div>
</div>

<%@ include file="../../includes/footer.jsp" %>

</body>
</html>