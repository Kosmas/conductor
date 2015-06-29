class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
    authorize @ticket, :create?
    @ticket.assets.build
  end

  def create
    whitelisted_params = ticket_params
    @ticket = @project.tickets.new

    unless policy(@ticket).tag?
      whitelisted_params.delete(:tag_names)
    end

    @ticket.attributes = whitelisted_params
    @ticket.author = current_user
    authorize @ticket, :create?

    if @ticket.save
      flash[:notice] = 'Ticket has been created.'
      redirect_to [@project, @ticket]
    else
      flash[:alert] = 'Ticket has not been created.'
      render 'new'
    end
  end

  def show
    authorize @ticket, :show?
    @comment = @ticket.comments.build(state_id: @ticket.state_id)
  end

  def edit
    authorize @ticket, :update?
  end

  def update
    authorize @ticket, :update?

    if @ticket.update(ticket_params)
      flash[:notice] = 'Ticket has been updated.'

      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = 'Ticket has not been updated.'

      render 'edit'
    end
  end

  def destroy
    authorize @ticket, :destroy?

    @ticket.destroy
    flash[:notice] = 'Ticket has been deleted.'

    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :tag_names,
      assets_attributes: [:asset, :asset_cache])
  end
end
