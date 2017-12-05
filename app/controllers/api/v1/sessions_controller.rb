class Api::V1::SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def show
    token = request.headers['Authorization']
    user = User.find_by(id: token.to_i)
    render json: {user_info: user, user_games: user.package_json, friends: user.friends}
  end

  def create
    user = User.find_by(username: params[:fields][:username])
    if user && user.authenticate(params[:fields][:password])
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: { jwt: token, yay: true }
    else
      render json: { error: "User/Password combination not found."}
    end
  end

  def issue_token(payload)
    JWT.encode(payload, "supersecretcode")
  end

end
