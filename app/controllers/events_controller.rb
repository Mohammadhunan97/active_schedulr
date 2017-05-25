class EventsController < ApplicationController
	def index
		if user_signed_in?
			# puts current_user.id
			 myevents = Event.where(user_id: current_user.id)
			 myevents.each do |e|
			 	puts e.title
			 	puts e.overview
			 end
		
			 @events = myevents.order('updated_at DESC')
		
		else
			redirect_to "/users/sign_in"
		end
	end

	def create
		Event.create(
			date: params["date"],
			title: params["title"],
			overview: params["overview"],
			user_id: current_user.id
			)
	end

	def update
		puts params
		Event.update(
			params["id"],
			:title => params["title"],
			:overview => params["overview"],
			:date => params["date"]
			)
	end

	def destroy
		Event.destroy(params["id"]);
	end
end

