class StaticPagesController < ApplicationController
  def home
  end

  def index
  end

  def betalist
  	@list = Betum.all
  end
  
end
