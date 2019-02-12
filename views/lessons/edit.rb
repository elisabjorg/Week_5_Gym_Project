<h2>Edit information <%= @lesson.title %></h2>

<form method="post" action="/lessons/" <%=@lesson.id%>"/>
  <div>
    <label for="title">Title:</label>
    <input type="text" name="title" id="title" value="<%=@lesson.title %>"/>
  </div>

  <div>
    <label for="instructor">Instructor:</label>
    <input type="text" name="instructor" id="instructor" value= "<%=@session.instructor %>"/>
  </div>

  <div>
    <input type="submit" value="Update"/>
  </div>
</form>

  <div>
    <form action="/lessons/<%= @lesson.id %>/delete" method="POST"><input type="submit" value="Delete"/></form>
  </div>
