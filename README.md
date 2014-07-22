mentoring-resources-sinatra-crud1
=================================

sinatra notes app with bcrypt authentication

#TODO
- only allow notes owner to delete note...one part of this:
- only display edit and delete buttons if the note was created by the current user
- make a partial for a navigation (just make it a list of links for now) and render it in the main layout view. include logic based on `current_user` for whether it displays login/signup links vs. All Post, My Posts, Logout links
- add error logic into note and user controllers and add to the views to display error messages
- create intermediary for confirming that the user really wants to delete a note