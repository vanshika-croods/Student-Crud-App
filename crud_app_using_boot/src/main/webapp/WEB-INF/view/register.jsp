<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<link href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
    <title>Student Crud app</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
  </head>
<body>
<div class="container">
<h1 class="text-center">Student Data</h1>
<form action="#" method='POST' id="userform" style="border:solid 2px black;padding:18px;">

   <input type="hidden" path="s_id" id="s_id">
	FirstName:<input type="text" name="firstName" path="firstName" id="firstName" class="form-control">
	LastName:<input type="text" name="lastName" path="lastName" id="lastName" class="form-control">
	UserName:<input type="text" name="userName" path="userName" id="userName" class="form-control">
	Password:<input type="password" name="password" path="password" id="password" class="form-control">
	
</form>
</div> 
<input type="submit" value="submit" onclick="setsubmit()" class="btn-danger" style="margin:20px 30px 10px 50px;">
<h1 class="text-center">Table Data</h1>
<div class="container">
<table id="example" class="display" style="width:100%" border="solid 2px black;">
        <thead>
            <tr>
                <th>Id</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>UserName</th>
                <th>Password</th>
                <th colspan="">Action</th>
            </tr>
        </thead>
        <tbody>
         <tbody id="stu_tbl">
	<c:forEach items="${studentlist}" var="i">
		<tr>
			<td>${i.s_id}</td>
			<td>${i.firstName}</td>
			<td>${i.lastName}</td>
			<td>${i.userName}</td>
			<td>${i.password}</td>
			<td><a href="#" onclick="delete1(${i.s_id})">Delete</a></td>
			<td><a href="#" onclick="edit(${i.s_id})">Edit</a></td>
		</tr>
	</c:forEach>
	
      </tbody>
        <tfoot>
            <tr>
                <th>Id</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>UserName</th>
                <th>Password</th>
                <th colspan="2">Action</th>
            </tr>
        </tfoot>
    </table>


<%-- <table id="tablebody" border="solid 2px black" class="table">
<thead>
	<tr>
		<th>Id</th>
		<th>FirstName</th>
		<th>LastName</th>
		<th>UserName</th>
		<th>Password</th>
		<th colspan="2">Action</th>
	</tr>
	
</thead>
<br/>
	<tbody id="stu_tbl">
	<c:forEach items="${studentlist}" var="i">
		<tr>
		<td>${i.s_id}</td>
		<td>${i.firstName}</td>
		<td>${i.lastName}</td>
		<td>${i.userName}</td>
		<td>${i.password}</td>
		<td><a href="#" onclick="delete1(${i.s_id})">Delete</a></td>
		<td><a href="#" onclick="edit(${i.s_id})">Edit</a></td>
	</tr>
	</c:forEach>
	
	</tbody>	
</table>
 --%>
 </div>
<script type="text/javascript">
var flag = 0;
function setsubmit(){
	
	if($("#s_id").val()==''){
		flag = 0;
	}
	else{
		flag = 1;
	}
	
	$.post("/saveStudent",{
		username:$("#userName").val(),
		pass:$("#password").val(),
		fn:$("#firstName").val(),
		ln:$("#lastName").val(),
		sid:$("#s_id").val()
	}, function(data){
		//alert()   
		var x =''
		
		if(flag==0){
		//condition here
		   x+='<tr>'+
				 '<td>'+data.s_id+'</td>'+
				 '<td>'+data.firstName+'</td>'+
				 '<td>'+data.lastName+'</td>'+
				  '<td>'+data.userName+'</td>'+
				  '<td>'+data.password+'</td>'+
				  '<td><a href="#" onclick="delete1('+data.s_id+')">Delete</a></td>'+
				  '<td><a href="#" onclick="edit('+data.s_id+')">Edit</a></td>'+
				  '</tr>';
				  $("#stu_tbl").append(x);
		}
		else{
			location.reload();
		}
});
	
}

function delete1(id){
	$.get("/delete/"+id,function(data,status){
		alert("click here");
		location.reload();
	})
}

function edit(id){
	$.get("/edit/"+id,function(data,status){
		alert("click here");
		$("#userName").val(data.userName);
		$("#password").val(data.password);
		$("#firstName").val(data.firstName);
		$("#lastName").val(data.lastName);
		$("#s_id").val(data.s_id);
	});
}

$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->

</body>
</html>