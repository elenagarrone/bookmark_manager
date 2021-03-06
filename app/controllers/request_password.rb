get '/request_password' do
  @on_page = true
  erb :"users/request_password"
end

post '/request_password' do
  email = params[:email]
  user = User.first(:email => email)
    if user
    user.password_token = (1..64).map{ ('A'..'Z').to_a.sample }.join
    user.save
    "Here is your token: #{ user.password_token }" #should be sent by email
  else
    flash[:errors] = ["Sorry, the user you've entered does not exist, try again."]
    redirect to ('/request_password')
  end
end

get "/users/request_password/:token" do
  user = User.first(:password_token => params[:password_token])
  return redirect to ('/request_password') if !user
  @token = params[:password_token]
  erb :"/users/new_password"
end

post '/request_password/new_password' do
  user = User.first(:password_token => params[:password_token]) #this token needs to be sent to the page new_password and been hidden
  if user
    user.update(password: params[:password], password_confirmation: params[:password_confirmation])
    erb :"users/succesful"
  end
end
