class GroupsController < ApplicationController
  def index
  end

  def new
    group_creation_service = CreateGroupService.new(group_params, 1)
    abort(group_creation_service.inspect)
  end

  def show
  end

  def create
    group_creation_service = CreateGroupService.new(group_params, 1)
    if group_creation_service.create_group
      redirect_to root_path, notice: "Le groupe a été créé avec succès."
    else
      flash.now[:alert] = "Une erreur est survenue lors de la création du groupe."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

private

  def group_params
    params.require(:group).permit(:name, :activity, :body, :status)
  end
end