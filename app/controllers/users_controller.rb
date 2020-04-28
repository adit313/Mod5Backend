class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    response = @users.map{|user| {"user" => user.device, "high_score" => user.rounds.sort{|a,b| b.score <=>a.score}}}
    render json: response
  end

  # GET /users/1
  def show
    render json: @user
  end

  def reset
    User.destroy_all
  end

  # POST /users
  def create
    if User.find_by(device: user_params[:device])
      @user = User.find_by(device: user_params[:device])
    else
      @user = User.new(user_params)
    end

    if @user.save
      @session = Session.find_or_create_by(user_id: @user.id, date: params[:date])
      @round = Round.create(session_id: @session.id, score: params[:score])
      render json: {"user" => @user, "session" => @session, "round" => @round}, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:device)
    end
end
