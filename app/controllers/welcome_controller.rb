class WelcomeController < ApplicationController

  def index
    # If configured for "bad behavior"...
    if ENV['BAD_BEHAVIOR'].to_s != ""
      # ...sleep an additional 250-750ms
      sleep((250 + rand(500)) / Float(1000))

      # ...and occasionally throw an unhandled exception
      if rand(10) == 0
        raise SyntaxError.new("random exception")
      end
     
    end
  end

end

