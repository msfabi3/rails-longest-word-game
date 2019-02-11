require 'open-uri'

class GamesController < ApplicationController
  def new
  letters = ('a'..'z').to_a
  @words = []
  6.times { @words << letters.sample }
  end

  def score
    url = 'https://wagon-dictionary.herokuapp.com/' + params[:word]
    response = JSON.parse(open(url).read)
    @api = response['found']
    session[:points] ||= 0
    session[:points] += 1 if @api == true
    @points = session[:points]
  end
end
