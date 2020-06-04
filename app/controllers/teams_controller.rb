class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team, only: [:edit, :update, :destroy]
  # load_and_authorize_resource

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.where(slug: params[:slug]).first
    authorize! :show, @team
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  # def edit
  # end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.user = current_user

    respond_to do |format|
      if @team.save
        format.html { redirect_to "/team/#{@team.slug}", notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  # def update
  #   respond_to do |format|
  #     if @team.update(team_params)
  #       format.html { redirect_to @team, notice: "Team was successfully updated." }
  #       format.json { render :show, status: :ok, location: @team }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @team.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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