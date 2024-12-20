<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Add ToDo Item</title>

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
        .navbar {
            background-color: #2C3D73;
            color: white;
            padding: 20px 15px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-container {
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            max-width: 600px;
            text-align: center;
        }

        .form-group {
            text-align: left;
        }

        .btn-center {
            display: block;
            margin: 20px auto;
        }
    </style>
</head>

<body>

    <!-- Navigation Bar -->
    <div class="navbar">
        My ToDo Manager
    </div>

    <div class="container form-container">
        <h2>Add a ToDo Item</h2>

        <form:form action="/saveToDoItem" method="post" modelAttribute="todo">
            <div class="form-group">
                <label for="title">Title</label>
                <form:input type="text" path="title" id="title" class="form-control" required="required" />
            </div>

            <div class="form-group">
                <label for="date">Date</label>
                <form:input type="date" path="date" id="date" class="form-control" required="required" />
            </div>

            <div class="form-group">
                <label for="status">Status</label>
                <form:input type="text" path="status" id="status" class="form-control" value="Incomplete" />
            </div>

            <button type="submit" class="btn btn-success btn-center">Save</button>
        </form:form>
    </div>

    <script>
        window.onload = function () {
            var msg = "${message}";
            console.log(msg);
            if (msg == "Save Failure") {
                Command: toastr["error"]("Something went wrong with the save.")
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
