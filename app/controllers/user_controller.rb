get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:user][:password_hash]
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  @posts = @user.posts
  erb :'users/show'
end

get '/users/:user_id/edit' do
  erb :'users/edit'
end

delete '/users/:user_id' do
  User.delete(params[:user_id])
  redirect '/'
end

put '/users/:user_id' do
  User.update_attributes(params[:user])
  redirect "/users/#{params[:user_id]}"
end
