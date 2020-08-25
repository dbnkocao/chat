class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  # GET /channels/1
  # GET /channels/1.json
  def show
    authorize! :show, @channel
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)
    @channel.user = current_user

    respond_to do |format|
      if @channel.save
        format.html { redirect_to "/teams/#{@channel.team.slug}", notice: "Team was successfully created." }
      else
        format.html { render json: @channel.errors, status: :unprocessable_entity }
      end
    end

    authorize! :create, @channel
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to "/teams/#{@channel.team.slug}", notice: "Team was successfully deleted." }
      format.json { head :no_content }
    end
    authorize! :destroy, @channel
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_channel
    @channel = Channel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def channel_params
    params.require(:channel).permit(:slug, :user_id, :team_id)
  end
end
