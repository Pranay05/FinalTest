class PasswordResetsController < ApplicationController

  def new

  end

def create

   user = User.find_by(email: params[:request][:email])
  if user.present?
   user.send_password_reset 
   render json:{ status: 200, message: "email send with password reset instruction" }
else 
	render json: {status: 500, message: "email not found"}
end




end
end
