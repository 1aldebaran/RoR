require 'time'
class RpgController < ApplicationController
  def index
    session[:gold] ||= 0
    session[:activities] ||= []
    render "index"
  end

  def farm
    @earn = rand(10..20)
    session[:gold] = session[:gold] + @earn
    @time = Time.current.strftime('%A, %b %dth, %Y %l:%M %p')
    session[:activities].push("Earned #{@earn} golds from the farm! (#{@time})")
    redirect_to '/rpg/index'
  end

  def cave
    @earn = rand(5..10)
    session[:gold] = session[:gold] + @earn
    @time = Time.current.strftime('%A, %b %dth, %Y %l:%M %p')
    session[:activities].push("Earned #{@earn} golds from the cave! (#{@time})")
    redirect_to '/rpg/index'
  end

  def house
    @earn = rand(2..5)
    session[:gold] = session[:gold] + @earn
    @time = Time.current.strftime('%A, %b %dth, %Y %l:%M %p')
    session[:activities].push("Earned #{@earn} golds from the house! (#{@time})")
    redirect_to '/rpg/index'
  end

  def casino
    if session[:gold] >= 50
      @earn = rand(-50..50)
      session[:gold] = session[:gold] + @earn
      @time = Time.current.strftime('%A, %b %dth, %Y %l:%M %p')
      if @earn < 0
        session[:activities].push("Entered a casino and lost #{@earn * -1} golds.. Ouch! (#{@time})")
      else
        session[:activities].push("Entered a casino and won #{@earn} golds! (#{@time})")
      end
    else
      session[:activities].push("You must have at least 50 golds to enter a casino")
    end
    redirect_to '/rpg/index'
  end
end
