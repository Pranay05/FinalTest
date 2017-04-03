class ImagesController < ApplicationController


def create
 
  user = User.find(params[:image][:user_id])
  return render json: {response: 500,msg: "user not found"} if user.blank?

  return render json: {response: 500,msg: "cannot upload more than 4 image"} if user.images.count == 5

     image = user.images.build(image_params)

    if image.save!

		render json: {image_id: image.id, status: 200 , message: "added succesfully"}
	else
		render json:{ staus: 400, message: " could not add" }
	end
  
 end

def show
 user = Image.find(params[:image][:user_id])
  return render json: {response: 500,msg: "user not found"} if user.blank?

  show_user = User.find(params[:image][:user_id])
  
   if user_role = show_user.role == 'queen'
   image = Image.where(user_id: user.id).last
   else
    image = Image.where(user_id: user.id)
   end

   image.to_json


 render json: { status: 200 , image: image }

end




 private
 
 def image_params
 	params.require(:image).permit(:user_id,:image)
end

end





end
