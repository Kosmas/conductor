class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end
end
