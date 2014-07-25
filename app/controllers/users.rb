enable :sessions

get '/users/login' do
  erb :'users/sessions/new'
end

post '/users/login' do
  @user = User.authenticate(params[:user])
  if @user
    session[:user_id] = @user.id
    redirect '/notes'
  else
    erb :'users/sessions/new' #use erb vs. redirect to save form data from previous attempt
  end
end

get '/users/signup' do
  erb :'users/registrations/new'
end

post '/users/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/notes'
  else
    redirect '/users/signup'
  end
end

# Show individual user if you wanted to
# GET '/users/:id' do
#   @user = current_user
#   erb :"users/show"
# end


post '/users' do
  @user = User.create!(params[:user]) #using bang method produces error earlier => good
  if @user.save
    session[:user_id] = @user.id
    redirect '/notes'
  else
    redirect '/users/signup'
  end
end


get '/users/signout' do
  session.clear
  redirect '/'
end

#----------- NESTED RESOURCES -----------
get '/users/:id/notes' do
  @user_notes = current_user.notes
  erb :'users/notes'
end



