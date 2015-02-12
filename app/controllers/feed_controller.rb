
class FeedController < ApplicationController

	def my_feeds
		@tag = Instagram.user_recent_media('1699076120')
		#@tag.map do |p|  puts p
		respond_to do |format|
			format.json { render json: {:message => 'success', :feeds => @tag} }
		end
	end

	def my_tags
		@tag = Instagram.tag_recent_media('teddy')
		#@tag.map do |p|  puts p
		respond_to do |format|
			format.json { render json: {:message => 'success', :feeds => @tag} }
		end
	end

	def my_tweets
		@tweets = Client.user('timesofindia')
		#@tag.map do |p|  puts p
		respond_to do |format|
			format.json { render json: {:message => 'success', :feeds => @tweets} }
		end
	end

	

	def my_fb_feeds
		user = '1440187149592867'
		@graph = Koala::Facebook::API.new(FACEBOOK_CONFIG['access_token'])
    	#profile = @graph.get_object(user) {|data| data['education']}
		#friends = @graph.get_connections(user, "taggable_friends")
		#profile = @graph.fql_query('select name, pic_square, FROM user WHERE uid ='+ user )
		#feed = @graph.fql_query("SELECT post_id, actor_id, target_id, message FROM stream WHERE source_id = me() AND created_time > START_TIME AND created_time < END_TIME LIMIT 10")
		feed = @graph.get_connections(user, "feed")
		#@tag.map do |p|  puts p
		respond_to do |format|
			format.json { render json: {:message => 'success', :profile => '', :friends => '', :feeds => feed} }
		end
	end



	def my_you
		youtube = YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)
		@data = youtube.videos_by(:query => "carlos cerro", :page => 1)
		respond_to do |format|
			format.json { render json: {:message => 'success', :data => @data} }
		end
	end

end
