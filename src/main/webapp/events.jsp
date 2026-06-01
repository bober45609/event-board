<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eventboard.model.Event" %>
<%@ page import="com.example.eventboard.service.EventService" %>

<html>
<head>
    <title>Event Board</title>

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
            padding: 25px;
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
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,.1);
        }

        th {
            background: #3498db;
            color: white;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
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

        .delete-btn {
            background: #e74c3c;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
        }

        .delete-btn:hover {
            background: #c0392b;
            text-decoration: none;
        }
    </style>

</head>
<body>

<h1>Event Board</h1>

<h2>Create Event</h2>

<form method="post" action="events">

    <p>
        Title:
        <input type="text" name="title" required>
    </p>

    <p>
        Date:
        <input type="date" name="date" required>
    </p>

    <p>
        Max Seats:
        <input type="number" name="maxSeats" required>
    </p>

    <button type="submit">
        Save Event
    </button>

</form>

<hr>

<h2>Events</h2>

<table>

    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Date</th>
        <th>Free Seats</th>
        <th>Details</th>
        <th>Delete</th>
    </tr>

    <%
        List<Event> events =
                (List<Event>) request.getAttribute("events");

        EventService eventService =
                (EventService) request.getAttribute("eventService");

        if (events != null && !events.isEmpty()) {

            for (Event e : events) {
    %>
    <%
        String error =
                (String) request.getAttribute("error");

        if(error != null){
    %>

    <p style="
color:red;
font-weight:bold;
padding:10px;
background:#ffe6e6;
border-radius:8px;
">
        <%= error %>
    </p>

    <%
        }
    %>

    <tr>

        <td><%= e.getId() %></td>

        <td><%= e.getTitle() %></td>

        <td><%= e.getEventDate() %></td>

        <td><%= eventService.getFreeSeats(e.getId()) %></td>

        <td>
            <a href="event?id=<%= e.getId() %>">
                Open
            </a>
        </td>

        <td>
            <a class="delete-btn"
               href="delete-event?id=<%= e.getId() %>"
               onclick="return confirm('Delete this event?')">
                Delete
            </a>
        </td>

    </tr>

    <%
        }
    } else {
    %>

    <tr>
        <td colspan="6">
            No events found
        </td>
    </tr>

    <%
        }
    %>

</table>

</body>
</html>
