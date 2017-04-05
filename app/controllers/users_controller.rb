class UsersController < ApplicationController


	def index
		
	end


	

 def home

    user = User.find(params[:request][:user_id])


    if User.exists? id: params[:request][:user_id]

    	if user.role.casecmp('king').zero?
      	other =  User.where.not(role: "King")
        end

       	if user.role.casecmp('queen').zero?
       		role = 'Girl'
          other = User.where('lower(role)=?',role.downcase)

      	end

     	if user.role.casecmp('boy').zero?
     		role = 'king'
      	other = User.where('lower(role)=?',role.downcase)
     	end

     	if user.role.casecmp('girl').zero?
     		role = 'Boy'
         other =User.where('lower(role)=?',role.downcase)
        end

      render json: {staus: 200, message: "home page" , home: other, role: user.role}

  else
  	render json: {response: 500,msg: "user not found"}
  end

end
  

   





def create

	@user = User.new(signup_params)
	
	if @user.save!
		#session[:user_id] = @user.id
		render json: {:user_id => @user.id, status: 200 , message: "signup sucessfully"}
	else
		render json:{ staus: 400, message: " could not signup sucessfully" }
	end
		

end

def show_other_profile
 user = User.find(params[:otheruser][:user_id])
 return render json: {response: 500,msg: "user not found"} if user.blank?

 render json:{message: "found user" , user: user, staus: 200}


end

def show
	@user = User.find(params[:request][:user_id])

 return render json: {response: 500,msg: "user not found"} if @user.blank?

    render json: {response: 200, user: @user}

end


def update
 	user = User.find_by(id: params[:user][:id])
	return render json: {response: 500,msg: "user not found"} if user.blank?

	 if user.update(update_params)
 		render json: {response: 200,message: "sucessfully updated" } 
	else
		render json: {response: 500,message: "coudn't update"}
	end

end	

def destroy
user = User.find_by(id: params[:request][:user_id])

return render json: {response: 500,msg: "user not found"} if user.blank?

	if user.destroy
    	render json: {response: 200, msg: "sucessfully destroyed"}
	end

end



	



 




private

def signup_params
params.require(:user).permit(:email,:password,:password_confirmation,:role)

end

def update_params
params.require(:user).permit(:email,:first_name,:last_name,:dob,:country,:city,:street,:state,:zip,:kids,:kingdom_today,:id)

end


def home_params
params.require(:request).permit(:user_id,:role)
end


end
