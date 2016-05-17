get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Incorrect Username/Password combination."]
    erb :'sessions/new'
  end
end


get '/sessions/:id' do
  session.clear
  redirect '/'
end
