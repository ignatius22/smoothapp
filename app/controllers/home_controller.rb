class HomeController < ApplicationController
  def index
    @title = "Welcome to the Smooth".upcase!

    if user_signed_in?  
      @welcome = current_user.first_name
    else
      @welcome = "Welcome guest"
    end
  end
end
