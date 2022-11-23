class UsersController < ApplicationController


  def show
    user = User.find_by(id: params[:id])
    if user

    render json: user, include: :items
    else
    render_not_found_response
    end
  end

  def index
    user = User.all 
    render json: user, include: :items
  end

  private 

  def render_not_found_response
    render json: {error: "User not found"}, status: :not_found
  end
end
