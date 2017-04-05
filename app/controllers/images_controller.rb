class ImagesController < ApplicationController


def create
 
  user = User.find(params[:image][:user_id])
  return render json: {staus: 500,message: "user not found"} if user.blank?

  return render json: {staus: 500,message: "cannot upload more than 4 image"} if user.images.count == 5

     image = user.images.build(image_params)

    if image.save!

		render json: {image_id: image.id, status: 200 , message: "added succesfully"}
	else
		render json:{ staus: 400, message: " could not add" }
	end
  
 end



def show
 user = Image.find(params[:image][:user_id])
 #to store each image url
  image_arr =[]
  return render json: {staus: 500,msg: "user not found"} if user.blank?

  show_user = User.find(params[:image][:user_id])
   #case to only provide last uploaded image of queen to front end
   if show_user.role.casecmp('queen').zero?
   user_image = Image.where(user_id: user.id).last
   image_arr = user_image.image.url
   else
    user_image = Image.where(user_id: user.id)
    user_image.each do |img|
    image_arr << img.image.url
     end
  end
render json: { status: 200 , image: image_arr}

end




 private
 
 def image_params
 	params.require(:image).permit(:user_id,:image)
end

end



