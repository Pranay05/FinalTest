class SessionsController < ApplicationController

def create
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])

		session[:user_id] = user.id
		render json: {user_id: user.id,response: 200,message: "sucessfully signed in"}
	else
		render json: {response: 500, message: "bad request"}
	end
end 

def destroy
	session[:user_id] = nil
	render json: {rseponse: 200, msg: "bad request"}
	
 
end


end
