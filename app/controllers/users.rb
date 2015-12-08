get '/users' do
	erb :'user/index'
end
#View login page

post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users/#{user.id}"
end
#Create new user

get '/users/new' do
	erb :"user/new"
end
#Display new user form

get '/users/:id' do
	@user = User.find(params[:id])
	erb :'user/show'
end
#View user profile

post '/users/login' do
	user = User.find_by(email: params[:email], password: params[:password])
	session[:user_id] = user.id
	redirect "/users/#{user.id}"
end
#User login

patch '/users/:id' do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password], contact: params[:contact])
	redirect "/users/#{user.id}"
end
#Update user

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'user/edit'
end
#Display user edit form

get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end
#User logout