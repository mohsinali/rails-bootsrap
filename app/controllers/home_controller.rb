class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @new_user = User.new
    unless params.blank?
      
    end
  end


end
