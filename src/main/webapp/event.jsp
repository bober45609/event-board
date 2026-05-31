<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eventboard.model.Event" %>
<%@ page import="com.example.eventboard.model.Participant" %>

<%
  Event event =
          (Event) request.getAttribute("event");
%>

<html>
<head>
  <title>Event Details</title>
</head>
<body>

<h1><%= event.getTitle() %></h1>

<p>
  <b>Date:</b>
  <%= event.getEventDate() %>
</p>

<hr>

<h2>Participants</h2>

<ul>

  <%
    List<Participant> participants =
            (List<Participant>)
                    request.getAttribute("participants");

    if (participants != null) {

      for (Participant p : participants) {
  %>

  <li>
    <%= p.getStudentName() %>
    -
    <%= p.getStudentEmail() %>
  </li>

  <%
      }
    }
  %>

</ul>

<hr>

<h2>Register for Event</h2>

<form method="post" action="event">

  <input type="hidden"
         name="eventId"
         value="<%= event.getId() %>">

  <label>Name:</label>
  <input type="text"
         name="name"
         required>

  <br><br>

  <label>Email:</label>
  <input type="email"
         name="email"
         required>

  <br><br>

  <button type="submit">
    Register
  </button>

</form>

<br>

<a href="events">
  Back to Events
</a>
<style>
  body{
    font-family: 'Segoe UI', sans-serif;
    background:#f4f6f9;
    margin:0;
    padding:40px;
  }

  .container{
    max-width:900px;
    margin:auto;
  }

  .card{
    background:white;
    border-radius:15px;
    padding:25px;
    margin-bottom:25px;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
  }

  h1{
    color:#2c3e50;
    margin-top:0;
  }

  h2{
    color:#34495e;
  }

  .event-date{
    color:#666;
    font-size:18px;
  }

  input{
    width:100%;
    padding:12px;
    border:1px solid #ddd;
    border-radius:8px;
    margin-top:5px;
    margin-bottom:15px;
    box-sizing:border-box;
  }

  button{
    background:#4f46e5;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:8px;
    cursor:pointer;
    font-size:16px;
  }

  button:hover{
    background:#3730a3;
  }

  ul{
    list-style:none;
    padding:0;
  }

  li{
    background:#f8fafc;
    margin:8px 0;
    padding:12px;
    border-radius:8px;
  }

  .back-link{
    display:inline-block;
    margin-top:15px;
    text-decoration:none;
    color:#4f46e5;
    font-weight:bold;
  }

  .back-link:hover{
    text-decoration:underline;
  }

  .badge{
    display:inline-block;
    background:#10b981;
    color:white;
    padding:6px 12px;
    border-radius:20px;
    font-size:14px;
  }
</style>

</body>
</html>