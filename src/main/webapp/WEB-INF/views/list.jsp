<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
	
	<main class="container">

	<h2>테스트 코드</h2>
	<!-- 보더 컨트롤러에서 model.addAttribute("boards", boards)의 "boards"로 접근할 수 있게 되는것 -->
		<!-- items="${boards.content}"에 담긴 리스트 하나씩 돈다 -->
		<c:forEach var="board" items="${boards.content}">
			<div class="card col-md-12 m-2">
				<div class="card-body">
					<h4 class="card-title">${board.title}</h4>
					<a href="/board/${board.id}" class="btn btn-primary">상세보기</a>
				</div>
			</div>
		</c:forEach>
		<br/>
		
		<!-- pageable.pageNumber 현재 페이지를 나타낸다. -->

		<ul class="pagination justify-content-center" >
			<c:choose>
				<c:when test="${boards.first}">
					<li class="page-item disabled"><a class="page-link" href="/list?page=${boards.pageable.pageNumber - 1}">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/list?page=${boards.pageable.pageNumber - 1}">Previous</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${boards.last}">
					<li class="page-item disabled"><a class="page-link" href="/list?page=${boards.pageable.pageNumber + 1}">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/list?page=${boards.pageable.pageNumber + 1}">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</main>
<%@ include file="layout/footer.jsp" %>
