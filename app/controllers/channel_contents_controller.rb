class ChannelContentsController < ApplicationController

    before_action :channel_join_memeber ,only: [:index, new, :create]

    def index
        @channel_contents = ChannelContent.where(channel_id: params[:channel_id])
        @channel = Channel.find(params[:channel_id])
    end

    def new
        @channel_content = ChannelContent.new
        @channel = Channel.find_by(id: params[:channel_id])
    end

    def create
        @channel = Channel.find_by(id: params[:channel_id])
        @channel_content = ChannelContent.new(channel_content_params)
        @channel_content.channel_id = params[:channel_id]
        @channel_content.user_id = current_user.id
        if @channel_content.save
            redirect_to channels_path
        else
            render 'new'
        end
    end


    private

    def channel_content_params
        params.permit(:title, :flag, :content, :emergency)
    end

    def channel_join_memeber
        @channel = Channel.find_by(id: params[:channel_id])
        @channel_box = []
        @channel.channel_users.each do |user|
           @channel_box.push(user.user_id.to_s)
        end
        if @channel_box.include?(current_user.id.to_s) == false
            redirect_to root_path
        end
    end
end
