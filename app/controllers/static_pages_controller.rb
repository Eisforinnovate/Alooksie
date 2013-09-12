class StaticPagesController < ApplicationController
  def home
  end

  def betalist
  	@list = Betum.all
  end
  
end
