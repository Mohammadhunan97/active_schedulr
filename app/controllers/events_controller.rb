class EventsController < ApplicationController
	def index
		if user_signed_in?
			@events = Event.all
		else
			redirect_to "/users/sign_in"
		end
	end
	
	def create
		puts params
		Event.create(
			date: params["date"],
			title: params["title"],
			overview: params["overview"],
			user_id: current_user.id
			)
	end
end


 # Book.create(title: params[:title],
 #      author: params[:authors],
 #      isbn: params[:isbn],
 #      description: params[:description],
 #      genre: params[:genre],
 #      user_id: current_user.id,
 #      status: "Shelfed")