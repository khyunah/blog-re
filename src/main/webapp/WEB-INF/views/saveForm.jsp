<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

<div class="container">
	<form action="">
		<div class="form-group">
			<label for="title">Title : </label>
			<!-- 폼태그 넘기려면 name="title" 네임 값 잇어여ㅑ함 -->
			<input type="text" class="form-control" placeholder="title" id="title">
		</div>
		
		<div class="form-group">
			<label for="content">Content : </label>
			<textarea class="form-control summernote" rows="5" id="content"></textarea>
		</div>
		<br/>
		<button type="button" onclick="saveBoard()" class="btn btn-primary">글쓰기</button>
	</form>
</div>
<br/>
	<script>
		function saveBoard(){
			let title = document.querySelector("#title").value;
			let content = document.querySelector("#content").value;
		
			console.log("title : " + title);
			console.log("content : " + content);
			
			let board = {
				title: title,
				content: content
			}
			
			fetch("/save", {
				// 헤더 부분 지정
				method: "post",
				headers: {
					"content-type": "application/json; charset=utf-8"
				},
				body: JSON.stringify(board)
				// 성공 하면 넘어와서 text로 변환
			})
			.then(res => res.text())
			.then(res => {
				if(res == "ok"){
					alert("글쓰기 성공");
					location.href = "/";
				} else{
					alert("글쓰기 실패");
				}
			});
			
		} // end of saveBoard
	
      $('.summernote').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 300
      });
    </script>

<%@ include file="layout/footer.jsp" %>
