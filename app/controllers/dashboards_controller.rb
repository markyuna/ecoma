class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def admin_index
    @users = User.all
    @tasks = Task.all
  end

  def user_index
    @users = User.all
    # @tasks = Task.all
  end

  def new

  end

  def show
    # Code pour afficher une ressource spécifique dans le dashboard
  end

  def edit
    # Code pour modifier une ressource spécifique dans le dashboard
  end
end
