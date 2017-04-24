class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end
  def new
  end
  def create
    if Dojo.create(dojo_create_params).valid?
      redirect_to root_path, notice: "You have successfully created a dojo"
    else
      flash[:notice] = "Unsuccessful"
      redirect_to :back
    end
  end
  def show
    @dojo =Dojo.find(params[:id])
    @students = Student.where(dojo:@dojo)
  end
  def edit
    @dojo = Dojo.find(params[:id])
  end
  def update
    dojo = Dojo.find(params[:id])
    if dojo.update(dojo_update_params)
      redirect_to root_path, notice: "You have successfully updated a dojo"
    else
      flash[:notice] = "Unsuccessful"
      redirect_to :back
    end
  end
  def destroy
    dojo = Dojo.find(params[:id])
    dojo.delete
    redirect_to :back
  end
  private
  def dojo_create_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
  def dojo_update_params
    params[:dojo].delete_if{|k, v| v.blank?}
    params.require(:dojo).permit(:branch, :street, :city, :state) unless params[:dojo].empty?
  end
end
