class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team, only: [:destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @message = Message.new
    @team = Team.where(slug: params[:slug]).first
    @channel = @team.channels.first
    authorize! :show, @team
    authorize! :create, @message
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.user = current_user

    respond_to do |format|
      if @team.save
        format.html { redirect_to "/teams/#{@team.slug}", notice: "Team was successfully created." }
      else
        format.html { redirect_to main_app.root_url, notice: @team.errors }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:slug)
  end
end
