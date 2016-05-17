before '*/posts/new' do
  if !current_user
    redirect '/sessions/new'
  end
end

before '*/vote' do
  if !current_user
    redirect '/sessions/new'
  end
end

get '/users/:user_id/posts/new' do
  if params[:user_id].to_i == current_user.id
    erb :'posts/new'
  else
    redirect "/users/#{current_user.id}/posts/new"
  end
end

post '/users/:user_id/posts' do
  @post = current_user.posts.create(params[:post])
  redirect "/users/#{current_user.id}/posts/#{@post.id}"
end

get '/users/:user_id/posts/:post_id' do
  @user = User.find(params[:user_id])
  @post = Post.find(params[:post_id])
  erb :'posts/show'
end

post '/users/:user_id/posts/:post_id/comments' do
  @user = User.find(current_user.id)
  @comment = @user.comments.create(post_id: params[:post_id], text: params[:text])
  redirect "/users/#{@user.id}/posts/#{params[:post_id]}"
end

post '/users/:user_id/posts/:post_id/vote' do
  Post.find(params[:post_id]).votes.create(user_id: params[:user_id])
  if request.xhr?
    Post.find(params[:post_id]).votes.length.to_s
  else
    redirect "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end
end

post '/users/:user_id/posts/:post_id/comments/:comment_id/vote' do
  Note.find(params[:comment_id]).votes.create(user_id: params[:user_id])
  if request.xhr?
    Note.find(params[:comment_id]).votes.length.to_s
  else
    redirect "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end
end

delete '/users/:user_id/posts/:post_id' do
  Post.delete(params[:post_id])
  redirect '/'
end

delete '/users/:user_id/posts/:post_id/comments/:comment_id' do
  Note.delete(params[:comment_id])
  redirect "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
end
