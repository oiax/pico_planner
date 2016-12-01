class LessonsController < ApplicationController
  def form
  end

  def register
    @user_name = params[:user][:name]
  end

  def hello
  end
end
