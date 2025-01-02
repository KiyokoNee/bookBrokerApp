<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Read Share</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/css/style.css" />
    	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body class="centered-content">
		<div class="d-flex justify-content-between mb-2">
			<div>
				<p class="m-0">Hello, <c:out value="${username}"></c:out>. Welcome to...</p>
				<h1>The Book Broker!</h1>
			</div>
			<div class="d-flex flex-column">
				<a href="/logout">Logout</a>
				<a href="/books/new">+ Add a book to my shelf</a>
			</div>
		</div>
		<p>Available Books to Borrow</p>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="book" items="${books}">
				<c:if test="${book.borrower == null}">
					<tr>
						<td><c:out value="${book.id}"></c:out></td>
						<td><a href="/books/${book.id}"><c:out value="${book.title}"></c:out></a></td>
						<td><c:out value="${book.author}"></c:out></td>
						<td><c:out value="${book.user.username}"></c:out></td>
						<td>
							<c:if test="${book.user.id == userId }">
								<a href="/books/${book.id}/edit">Edit</a>
								<a href="/books/${book.id}/delete">Delete</a>
							</c:if>
							<c:if test="${book.user.id != userId}">
								<a href="/books/${book.id}/borrow">Borrow</a>
							</c:if>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table>
		<p>Books I'm Borrowing...</p>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="book" items="${borrowed}">
				<tr>
					<td><c:out value="${book.id}"></c:out></td>
					<td><a href="/books/${book.id}"><c:out value="${book.title}"></c:out></a></td>
					<td><c:out value="${book.author}"></c:out></td>
					<td><c:out value="${book.user.username}"></c:out></td>
					<td>
						<a href="/books/${book.id}/return">Return</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</body>
</html>