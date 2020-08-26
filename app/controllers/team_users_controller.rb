class TeamUsersController < ApplicationController
  before_action :set_team_user, only: [:show, :edit, :update]

  def show
  end

  # POST /team_users
  # POST /team_users.json
  def create
    @team_user = TeamUser.new(team_user_params)

    respond_to do |format|
      if @team_user.save
        format.html { redirect_to "/teams/#{@team_user.team.slug}", notice: "User added successfully." }
      else
        format.html { render json: @team_user.errors, status: :unprocessable_entity }
      end
    end
    authorize! :create, @team_user
  end

  # DELETE /team_users/1
  # DELETE /team_users/1.json
  def destroy
    @team_user = TeamUser.where(user_id: params[:id], team_id: params[:team_id]).first

    @team_user.destroy
    respond_to do |format|
      format.html { redirect_to team_users_url, notice: "Team user was successfully destroyed." }
      format.json { head :no_content }
    end
    authorize! :destroy, @team_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team_user
    @team_user = TeamUser.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_user_params
    user = User.find_by(email: params[:team_user][:email])
    params.require(:team_user).permit(:team_id).merge(user_id: user.id)
  end
end
