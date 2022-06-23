<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

<div class="container">
	<form action="">
		<div class="form-group">
			<label for="title">Title : </label>
			<input type="text" class="form-control" placeholder="title" id="title" value="${board.title}">
		</div>
		
		<div class="form-group">
			<label for="content">Content : </label>
			<textarea class="form-control summernote" rows="5" id="content">${board.content}</textarea>
		</div>
		<br/>
		<button type="button" onclick="updateBoard(${board.id})" class="btn btn-primary">글 수정하기</button>
	</form>
</div>
<br/>
	<script>
		function updateBoard(id){
			console.log("id : " + id);
			
			let title = document.querySelector("#title").value;
			let content = document.querySelector("#content").value;
			
			let board = {
				title: title,
				content: content
			}
			
			// 비동기 가능한 함수 fetch()
			fetch("/board/${id}", {
				// 헤더 부분 지정
				method: "put",
				headers: {
					"content-type": "application/json; charset=utf-8"
				},
				body: JSON.stringify(board)
				// 성공 하면 넘어와서 text로 변환
			})
			.then(res => res.text())
			.then(res => {
				if(res == "ok"){
					alert("글수정 성공");
					location.href = "/";
				} else{
					alert("글수정 실패");
				}
			});
			
		} // end of updateBoard
	
      $('.summernote').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 300
      });
    </script>

<%@ include file="layout/footer.jsp" %>
