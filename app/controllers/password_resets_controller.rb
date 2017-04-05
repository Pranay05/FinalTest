class PasswordResetsController < ApplicationController

  def new

  end

def create

   user = User.find_by(params[:email])
  user.send_password_reset if user
  render json:{ staus: 200, message: "email send with password reset instrauction" }

end




end
