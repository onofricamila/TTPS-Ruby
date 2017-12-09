class HomeController < ApplicationController
  # para que si no hay nadie logueado te lleve al login
  before_action :authenticate_user!

  def index
  end
end
