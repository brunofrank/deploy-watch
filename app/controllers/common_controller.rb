class CommonController < ApplicationController
  before_filter :authenticate_user!, :except => [:make_deploy]
  
  def index
    @projects = current_user.projects
  end
  
  def make_deploy
    project = Project.find_by_uuid params[:id]
    if project
      deploy = Deploy.new
      deploy.user = project.user
      deploy.project = project
      deploy.save

      render :json => :ok      
    else
      render :json => :fail            
    end
  end
end
