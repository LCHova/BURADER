<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>modify</title>
</head>
<body>

<table border="1">
<th>��ǰ�ڵ�</th>
<th>��ǰ��</th>
<th>�����</th>
<th>����â��</th>
<th>�ǻ緮</th>
<th>����</th>

  <c:forEach var="inventory" items="${inventoryList}">
   <tr>
   <td>${inventory.ma_id}</td>
   <td>${inventory.ma_name}</td>
   <td>${inventory.ma_qty}</td>
   <td>${inventory.whs_num}</td>
   <td><input type="text" ></td>
   </tr>
  </c:forEach>
  
</table>
</body>
</html>