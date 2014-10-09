get '/request_password' do
  erb :"users/request_password"
end

post '/request_password' do
  email = params[:email]
  user = User.first(:email => email)
  	if user
	  user.password_token = (1..64).map{('A'..'Z').to_a.sample}.join
	  user.password_token_timestamp = Time.now
	  user.save
	  "Here is your token: #{user.password_token}"
	else
	  flash[:errors] = ["Sorry, the user you've entered does not exist, try again."]
	  redirect to ('/request_password')
	end
end

get "/request_password/:token" do
	erb :"/users/new_password"
end

# post '/request_password/new_password' do
#    new_password = params[:new_password]
#    user = User.first(:new_password => new_password,
# 					 :new_password_confirmation => params[:password_confirmation])
#    if user.new_password == user.password_token
#    	  user.save
#    	  "Your password has been updated"
#    	else
#    		"Try again."
#    	end
# end