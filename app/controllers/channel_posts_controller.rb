class ChannelPostsController < ApplicationController
    def new
        @channelpost = current_user.channelPosts.new
        @channel = Channel.find_by(id: params[:channel_id])
    end

    def create
        @channel = Channel.find_by(id: params[:channel_id])
        @channelpost = current_user.channelPosts.new(channelpost_params)
        @channelpost.channel_id = params[:channel_id]
        if @channelpost.save
          redirect_to channel_path(@channel.id)
        end
      end
    
    private
        def channelpost_params
            params.require(:grouppost).permit(:content)
        end
end
