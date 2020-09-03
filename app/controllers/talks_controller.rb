class TalksController < ApplicationController
  before_action :set_talk, only: [:show]

  # GET /talks/1
  # GET /talks/1.json
  def show
    # authorize! :show, @talk
  end

  # POST /talks
  # POST /talks.json
  def create
    @talk = Talk.new(talk_params)

    respond_to do |format|
      if @talk.save
        format.json { render :show, status: :created, location: @talk }
      else
        format.html { render :new }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_talk
    @talk = Talk.find_talk_users(current_user.id, params[:id], params[:team_id])
    @talk = Talk.new if @talk.blank?
    @talk
  end

  # Only allow a list of trusted parameters through.
  def talk_params
    params.require(:talk).permit(:user_one_id, :user_two_id, :team_id)
  end
end
