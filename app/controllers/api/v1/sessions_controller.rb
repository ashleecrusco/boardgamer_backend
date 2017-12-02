class Api::V1::SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:create]


  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: { id: payload, username: user.username, first_name: user.first_name, last_name: user.last_name jwt: token, yay: true }
    else
      render json: { error: "some bad stuff happened"}
    end
  end

  def show
    byebug
    # token = request.headers['Authorization']
    # user = User.find_by(id: token)
    # if logged_in?
    #   render json: { id: user.id, username: user.username }
    # else
    #   render json: {error: 'No user could be found'}, status: 401
    # end
  end

end
