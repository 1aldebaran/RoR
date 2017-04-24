class TeamsController < ApplicationController
  def index
    @teams = Team.all
    render json: @teams
  end

  def new
  end

  def create
    @team = Team.create( name: params[:name], mascot: params[:mascot], stadium: params[:stadium])
    redirect_to '/teams/index'
  end

  def edit
  end

  def show
    @team = Team.find(params[:id])
    render json: @team
  end

  def delete
  end

  def total
    render text: Team.count
  end

  def times
    if !session[:count]
      @count = 0
      session[:count] = @count
    end
    render text: session[:count] += 1
  end
   def restart
     reset_session
     redirect_to "/teams/times", notice: "Destroyed session"
   end
end
