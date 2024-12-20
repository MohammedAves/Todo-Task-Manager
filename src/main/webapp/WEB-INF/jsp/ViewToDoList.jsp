<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View ToDo Item List</title>

    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        a {
            color: white;
        }

        a:hover {
            color: white;
            text-decoration: none;
        }

        .task-box {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .navbar {
			background-color: #2C3D73;
			            color: white;
			            padding: 20px 15px;
			            text-align: center;
			            font-size: 10px;
			            font-weight: bold;
			            display: flex;
			            align-items: center;
			            justify-content: center;
        }
		.h1text{
			font-size: 28px;
			font-weight: bold;
			align-items: center;
			justify-content: center;
		}

    </style>

</head>
<body>

    <!-- Top Navigation Bar -->
    <div class="navbar">
        <h1 class="h1text">My ToDo Manager</h1>
    </div>

    <div class="container">
        <!-- Task Box -->
        <div class="task-box">
            <h2 class="p-3 text-center">ToDo Item List</h2>

            <form:form>
                <table class="table table-bordered">
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Mark Completed</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>

                    <c:forEach var="todo" items="${list}">
                        <tr>
                            <td>${todo.id}</td>
                            <td>${todo.title}</td>
                            <td><fmt:formatDate value="${todo.date}" pattern="yyyy-MM-dd" /></td>
                            <td>${todo.status}</td>
                            <td><button type="button" class="btn btn-success">
                                <a href="/updateToDoStatus/${todo.id}">Mark Complete</a>
                            </button></td>
                            <td><button type="button" class="btn btn-primary">
                                <a href="/editToDoItem/${todo.id}">Edit</a>
                            </button></td>
                            <td><button type="button" class="btn btn-danger">
                                <a href="/deleteToDoItem/${todo.id}">Delete</a>
                            </button></td>
                        </tr>
                    </c:forEach>

                </table>
            </form:form>

            <!-- Add New Item Button -->
            <button type="button" class="btn btn-primary btn-block">
                <a href="/addToDoItem">Add New ToDo Item</a>
            </button>
        </div>
    </div>

    <script th:inline="javascript">
        window.onload = function () {
            var msg = "${message}";

            if (msg == "Save Success") {
                Command: toastr["success"]("Item added successfully!!")
            } else if (msg == "Delete Success") {
                Command: toastr["success"]("Item deleted successfully!!")
            } else if (msg == "Delete Failure") {
                Command: toastr["error"]("Some error occurred, couldn't delete item")
            } else if (msg == "Edit Success") {
                Command: toastr["success"]("Item updated successfully!!")
            }

            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
        }
    </script>

</body>

</html>
