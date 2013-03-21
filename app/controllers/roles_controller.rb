class RolesController < ApplicationController
  before_filter :authenticate_user!
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])

    if @role.save
      redirect_to roles_path, :notice => "Role created successfully."
    else
      flash[:error] = "Role could not be created."
      render :action => "new"
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def destroy
    role = Role.find(params[:id])
    role.destroy
    redirect_to roles_path, :notice => "Role has been deleted."
  end
end
