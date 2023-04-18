class ChannelsController < ApplicationController
  def index
    @channels = Channel.all.order(updated_at: :desc)
  end


  def new
    @channel = Channel.new
    @channel.users << current_user
  end

  def create
     @channel = Channel.new(channel_params)
     if @channel.save
      redirect_to channels_path, notice: 'グループを作成しました。'
    else
      render 'new'
    end
  end

  def show
    @channel = Channel.find_by(id: params[:id])

    if !@channel.users.include?(current_user)
      @channel.users << current_user
    end

    @channelposts = ChannelPost.where(channel_id: @channel.id).all
  end

  private

  def channel_params
   params.require(:channel).permit(:name, user_ids: [])
  end

  def grouppost_params
    params.require(:channel_post).permit(:content)
  end
end

