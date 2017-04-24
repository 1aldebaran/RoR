require 'time'

class TimesController < ApplicationController
  def main
    @d = Time.current.strftime('%A, %b %dth, %Y')
    @t = Time.current.strftime('%l:%M %p')
  end
end
