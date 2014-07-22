enable :sessions

# before '/notes/*' do
#   User.authenticate
# end

#LIST NOTES
get '/notes' do
  @notes = Note.all
  @user = current_user
  erb :'notes/index'
end



#SHOULD DISPLAY FORM FOR CREATING NEW NOTE
get '/notes/new' do
  @note = Note.new
  erb :"notes/new"
end

#SHOW NOTE
get '/notes/:id' do
  @note = Note.find(params[:id])
  erb :'notes/show'
end

post '/notes/new' do
  @note = Note.new
end

#CREATE NOTE
post '/notes' do
  @note = current_user.notes.create!(params[:note])
  if @note.save
     redirect to("/notes/#{@note.id}")
  else
    erb :"notes/new"
  end
end

#DISPLAY FORM FOR UPDATING NOTE
get '/notes/:id/edit' do
  @note = Note.find(params[:id])
  halt(401,'Not Authorized') unless current_user.id == @note.user_id
  erb :"notes/edit"
end

#UPDATE NOTE
put '/notes/:id' do
  @note = Note.find(params[:id])
  if @note.update_attributes(params[:note])
    redirect to ("/notes/#{@note.id}")
  else
    erb :"/notes/edit"
  end
end

#DELETE NOTE
delete '/notes/:id' do
  Note.find(params[:id]).destroy
  redirect to('/notes')
end



