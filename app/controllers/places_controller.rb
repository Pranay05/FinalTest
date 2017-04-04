class PlacesController < ApplicationController

 def create
 
  user = User.where(id: params[:place][:user_id]).first
  return render json: {response: 500,msg: "user not found"} if user.blank?

    place = user.places.new(place_params)

      if place.save!

		render json: {place_id: place.id, status: 200 , message: "added succesfully"}
	else
		render json:{ staus: 400, message: " could not add" }
	end
  
 end

def show
 user = Place.where(id: params[:place][:user_id]).first
  return render json: {response: 500,msg: "user not found"} if user.blank?

  place = Place.where(user_id: user.id)
  place.to_json


 render json: { status: 200 , place: place }

end




 private
 
 def place_params
 	params.require(:place).permit(:user_id,:liked_place)
end

end
