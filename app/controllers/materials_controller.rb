class MaterialsController < ApplicationController
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    @materials = Material.all.sort_by{|x| x.created_at}.reverse
  end

  def new
    @material = Material.new
  end

  def show
    @material = Material.find(params[:id])
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      flash[:notice] = "Your post was created."
      redirect_to materials_path
    else
      flash[:notice] = "There was an error."
      render :new
    end
  end

  def edit
    @material = Material.find(params[:id])
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      flash[:notice] = "The update was successful."
      redirect_to materials_path
    else
      render :edit
    end
  end


private

  def material_params
    params.require(:material).permit(:title, :body)
  end

  def require_admin
    access_denied unless logged_in? and current_user.admin?
  end

end