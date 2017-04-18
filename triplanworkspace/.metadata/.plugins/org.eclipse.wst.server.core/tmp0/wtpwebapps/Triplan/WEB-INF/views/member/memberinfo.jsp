<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원정보 보기 및 수정 </title>

<script src="/SpringBegin/src/main/webapp/js/jquery-2.0.0.js"></script>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script> -->
<script type="text/javascript">

</script>

<style type="text/css">

	a {text-decoration: none;}
	
	.circle1 {
		background-image: url("/spring/resources/cam.jpg");
		background-color:#fff;
		border: 3px black solid;
		width: 200px;
		height: 200px;
		background-position: center center;
		-webkit-border-radius:100px;
		-moz-border-radius: 100px;
	}	
	
	td { height: 40px;}
</style>


</head>
<body>
	<div style="width:500px; height:600px; background:#e6e6ff; float:left; margin-left: 120px; margin-top: 12px;" align="center">
		<table>
			<tr>
				<td>
				<div class="container">
					  <h2 style="padding-left: 147px;"> 회원정보 보기 </h2>
					  <br>
					  <div style="padding-left: 142px;">           
					  	<div class="circle1" ></div>
					  </div> 
				</div>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="padding-left: 60px; padding-top: 3px;">
					<span style="font-weight: bold; font-size: 13pt;">ID&nbsp; :&nbsp; </span><input type="text" name="ID" size="30" placeholder=" 아이디" readonly/>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px;">
					<span style="font-weight: bold; font-size: 13pt;">이름&nbsp; :&nbsp;</span><input type="text" name="name" size="30" placeholder=" 이름" readonly/>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px;">
					<span style="font-weight: bold; font-size: 13pt;">생일&nbsp; :&nbsp;</span><input type="text" name="birth" size="30" placeholder=" 생일" readonly/>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px;">
					<span style="font-weight: bold; font-size: 13pt;">email&nbsp; :&nbsp;</span><input type="text" name="email" size="30" placeholder=" email" readonly/>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px;">
					<span style="font-weight: bold; font-size: 13pt;">휴대폰번호&nbsp; :&nbsp;</span><input type="text" name="ID" size="30" placeholder=" 휴대폰번호" readonly/>
				</td>
			</tr>
			<tr>
      			<td style="padding-left: 210px; padding-top: 20px">
      				<button type="button" class="btn btn-default">정보 수정</button>
      			</td>
     		</tr>
			
		</table>
	</div>
		
	<div style="width:500px; height:600px; background:#e6e6ff; float:left; margin-left: 120px; margin-top: 12px;">
		<table>
			<tr>
				<td>
				<div class="container">
					  <h2 style="padding-left: 147px;"> 회원정보 수정 </h2><br><br>
					  <!--  <p style="padding-left: 285px; padding-top:1px; font-size: 13pt; font-weight: bold;"><a href="" >이미지 변경</a></p><br> -->
					  <div style="padding-left: 142px; padding-top: 1px;">           
					  	<div class="circle1" ></div><a href="" style="padding-left: 230px;">이미지 변경</a>
					  </div> 
					 
				</div>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px; padding-top:5px;">
					<span style="font-weight: bold; font-size: 13pt">ID&nbsp; :&nbsp; </span><input type="text" name="ID" size="30" placeholder=" 아이디" />
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px;">
					<span style="font-weight: bold; font-size: 13pt">이름&nbsp; :&nbsp;</span><input type="text" name="name" size="30" placeholder=" 이름" />
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px;">
					<span style="font-weight: bold; font-size: 13pt">생일&nbsp; :&nbsp;</span><input type="text" name="birth" size="30" placeholder=" 생일" />
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px;">
					<span style="font-weight: bold; font-size: 13pt;">email&nbsp; :&nbsp;</span><input type="text" name="email" size="30" placeholder=" email"/>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 60px;">
					<span style="font-weight: bold; font-size: 13pt">휴대폰번호&nbsp; :&nbsp;</span><input type="text" name="ID" size="30" placeholder=" 아이디" />
				</td>
			</tr>
			<tr>
      			<td style="padding-left: 210px; padding-top: 20px">
      				<button type="button" class="btn btn-default">수정완료</button>
      			</td>
     		</tr>
			
		</table>	
	</div>
	

</body>
</html>