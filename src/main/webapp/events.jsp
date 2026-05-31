<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eventboard.model.Event" %>

<html>
<head>
    <title>Event Board</title>
</head>
<body>

<h1>Event Board</h1>

<h2>Create Event</h2>

<form method="post" action="events">

    Title:
    <input type="text" name="title" required>

    <br><br>

    Date:
    <input type="date" name="date" required>

    <br><br>

    Max Seats:
    <input type="number" name="maxSeats" required>

    <br><br>

    <button type="submit">
        Save Event
    </button>

</form>

<hr>

<h2>Events</h2>

<table border="1">

    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Date</th>
        <th>Details</th>
    </tr>

    <%
        List<Event> events =
                (List<Event>) request.getAttribute("events");

        if (events != null) {

            for (Event e : events) {
    %>

    <tr>
        <td><%= e.getId() %></td>

        <td><%= e.getTitle() %></td>

        <td><%= e.getEventDate() %></td>

        <td>
            <a href="event?id=<%= e.getId() %>">
                Open
            </a>
        </td>
    </tr>

    <%
            }
        }
    %>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 40px;
        }

        h1 {
            color: #2c3e50;
        }

        h2 {
            color: #34495e;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,.1);
            margin-bottom: 30px;
        }

        input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin: 5px;
        }

        button {
            background: #3498db;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background: #2980b9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,.1);
        }

        th {
            background: #3498db;
            color: white;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f8f9fa;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>

</table>

</body>
</html>