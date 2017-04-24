class StudentsController < ApplicationController
    def index
      @students = Student.all
    end
    def new
      @dojo = Dojo.find(params[:dojo_id])
      @dojos = Dojo.all
    end
    def create
      if Student.create(student_create_params).valid?
        redirect_to root_path, notice: "You have successfully created a student"
      else
        flash[:notice] = "Unsuccessful"
        redirect_to :back
      end
    end
    def show
      @dojo = Dojo.find(params[:dojo_id])
      @student =Student.find(params[:id])
      @students = Student.where(dojo:@dojo)
    end
    def edit
      @student = Student.find(params[:id])
      @dojo = Dojo.find(params[:dojo_id])
      @dojos = Dojo.all
    end
    def update
      student = Student.find(params[:id])
      if student.update(student_update_params)
        redirect_to dojo_student_path, notice: "You have successfully updated a student"
      else
        flash[:notice] = "Unsuccessful"
        redirect_to :back
      end
    end
    def destroy
      student = Student.find(params[:id])
      student.delete
      redirect_to :back
    end
    private
    def student_create_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
    def student_update_params
      params[:student].delete_if{|k, v| v.blank?}
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id) unless params[:student].empty?
    end
  end
