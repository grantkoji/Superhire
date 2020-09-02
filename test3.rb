# 2020.06.17: 

# https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToKgZ1s-pWWrGI5IuPcCtqrs5EeGfbEmFG31bXLSNGDK2_zawJUw&s

    # Pre-2020.06.17 Code in app/views/layouts/application.html.erb: 

<!DOCTYPE html>
<html>
  <head>
    <title>Book a Superhero</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>

  <style>
    .header {
      background-color: deepskyblue;
      color: white;
      padding: 1px;
      border: 1px solid white;
      text-align: center;
    }

    body {
      color: black;
    }

    ul {
      list-style-type: none;
      border: 0px solid white;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: deepskyblue;
    }
    
    li {
      float: left;
      border-right: 1px solid white;
    }

    li a {
      display: block;
      width: 160px;
      height: 25px;
      background-color: deepskyblue;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    li a:hover {
      background-color: deepskyblue;
    }

    .active {
      background-color: cornflowerblue;
    }

    .footer {
      background-color: deepskyblue;
      color: white;
      padding: 1px;
      border: 1px solid white;
      text-align: center;
    }
    
  </style>

  </head>

  <body>

    <div class="header"> 
      <h1>Book a Superhero</h1>
    </div>

    <div class="nav">
      <ul>
        <li><a class="active" href='/superheros'>Home</a></li>
        <!-- <li><a class="active" href='/search'>Search for Superheroes</a></li> -->
        <!-- <li><a href='/superheros'>Search for Superheroes</a></li> -->
        <li><%= link_to "Search for Superheroes", superheros_path %></li>
        <!-- <li><a class="active" href='/appointments'>Appointments</a></li> -->
        <li><a href='/appointments/new'>Appointments</a></li>
      </ul>
    </div>

    <% if @current_user %>
    <li class="right">Welcome <%= @current_user.name %></li>
      <%= button_to 'Logout', "/sessions/#{@current_user.id}", method: :delete %>
    <% else %>
    <li class="right"><%= link_to "Sign Up", new_user_path %></li>
      <%= button_to 'Login', new_session_path, method: :get %>
    <% end %> 



    <%= yield %>

    <div class="footer">
      <p>Reserve Your Favorite Superheroes Here Today!</p>
    </div>
  </body>
</html>
