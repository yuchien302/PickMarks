class MainController < ApplicationController
  before_filter :authenticate, :only => [:app]


  def welcome
  end
  
  def app
  end

end
