class Api::ProfilesController < ApplicationController


# Author: Travis A Ebesu (c) 2013
# Date: 8/10/2013
# 	To DO:
# 		Input filtering 


# Parameters 

before_filter :authenticate_user!
respond_to :json


	def single
# 		event_id = Integer(params[:id])
# 		@event = Event.find_by_id event_id
# 		if @event.nil?
# 			render :json => {:message => "Event Not Found"}, :callback => params[:callback]
# 			return
# 		else
# 			render :status => 200, :success => true, :json => {:event => @event}, :callback => params[:callback]
# 		end
	end
	
#  name                   :string(255)
#  authentication_token   :string(255)
#  host_id                :string(255)
#  firstname              :string(255)
#  lastname               :string(255)
#  phone                  :string(255)
#  age                    :integer
#  city                   :string(255)
#  state                  :string(255)
#  zipcode                :integer
#  school                 :string(255)
	
	def view
		token = params[:auth_token]
		email = params[:email]
		

		profile = User.find_by_email(email)

		# check event null
		if profile.nil?
			render :json => {:message => profile}, :callback => params[:callback]
			return
		end
		render :status=>200, :success => true, :json=>{:firstname => profile.firstname, :lastname => profile.lastname, :age => profile.age, :school => profile.school}, :callback => params[:callback]
		
	end
	
	    
	def create
# 		debug = false
# 			
# 			
# 		if request.format != :json
# 			render :status=> 406, :json=>{ :message=> "The request must be json"}, :callback => params[:callback]
# 			return
# 		end
# 		puts "starting create event"
# 		activity = params[:activity]
# 		description = params[:description]
# 		max_attend = params[:max]
# 		start_time = params[:start].to_time
# 		end_time = params[:end].to_time
# 		location = params[:location]
# 		#Ensure time are in right format
# 
# 		@user = User.find_by_authentication_token(params[:auth_token])	
# 		if start_time > end_time
# 			render :json => {:message => "Cannot start before it ends"}, :callback => params[:callback]
# 			return
# 		end
# 		# we found user 
# 		if @user.nil?
# 			render :json => {:message => "Token not found"}, :callback => params[:callback]
# 			return
# 		end
# 
# 		# TO DO:	Check if user is busy
# 		# 			Check for duplicates, based on date & host_id
# 
# 	
# 		# Tries to check if user is busy
# 		# If user is busy they also cannot create event
# # 		@userevent = UserEvent.where("user_id = ?", @user.id)
# # 		@userevent.each do |user_event|
# # 			# find each event time the user is linked with
# # 			@event = Event.find user_event.event_id
# # 
# # 			if debug	# debug
# # 				if start_time <= @event.time_end
# # 					puts "Start_Time <= Event.time_end"
# # 				end
# # 				if start_time >= @event.time_end 
# # 					puts "Start_Time >= Event.time_end"
# # 				end
# # 				if end_time >= @event.time_start
# # 					puts "end_time >= @event.time_start"
# # 				end
# # 				if end_time <= @event.time_start
# # 					puts "end_time <= @event.time_start"
# # 				end
# # 				
# # 				puts " "
# # 				puts " "
# # 			end
# # 			if start_time >= @event.time_end and end_time >= @event.time_start
# # 					render :status=>406, :json => {:message => "time overlap", :event => @event}, :callback => params[:callback]
# # 					return
# # 			end
# # 		end
# 		puts "Creating Event"
# 	
# 		@event = Event.create :activity => activity, :description => description, :max_attend => max_attend, :time_start => start_time, :time_end => end_time, :location => location, :cur_attend => 1, :host_id => @user.email
# 		# Check Event already exists by user, no duplicates and user not busy
# 		UserEvent.create :event_id => @event.id, :user_id => @user.id
# 				
# 		 render :status => 200, :json=>{:message=> "Successfully added event", :debug => @event}, :callback => params[:callback]
	end
	
	def destroy
	end

end

