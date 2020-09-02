# 2020.06.16

# For demo: 
  # First: Non-Premium (to show ad)
  # Second: Premium

# 2020.06.15

# Additional Notes: 
    # Basic Nav Bar & Footer added to app/views/layout/application.html.erb
    # Link for "Search for Superheroes" not working - no method error appears 

# Original Copy: 
    # app/views/layouts/application.html.erb

<!DOCTYPE html>
<html>
  <head>
    <title>Mod2App</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body> 
</html> 