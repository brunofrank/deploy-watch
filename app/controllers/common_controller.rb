class CommonController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @projects = current_user.projects
  end
  
  def make_deploy
    project = Project.find params[:id]
    user = User.find_by_authentication_token params[:token] if params[:token].present?
    deploy = Deploy.new
    if user
      deploy.user = user 
    else
      deploy.user = project.user
    end
    deploy.project = project
    deploy.save
    
    render :json => :ok
  end
end
