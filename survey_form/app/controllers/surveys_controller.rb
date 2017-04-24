class SurveysController < ApplicationController
  def index
  end
  def create
    @survey = Survey.create(survey_params)
    session[:id] = @survey.id
    session[:count] = session[:count] + 1
    redirect_to '/surveys/result', notice: "Thanks for submitting this form! You have submitted this form #{session[:count]} times now"
  end
  def result
    if !flash[:notice]
      redirect_to '/surveys/index'
    else
      session[:count] ||= 0
      @survey = Survey.find(session[:id])
    end
  end
  private
  def survey_params
    params.require(:survey).permit(:name, :location, :language, :comment)
  end
end
